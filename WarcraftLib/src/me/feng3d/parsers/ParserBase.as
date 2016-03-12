package me.feng3d.parsers
{
	import flash.events.TimerEvent;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	import flash.utils.getTimer;

	import me.feng.error.AbstractClassError;
	import me.feng.error.AbstractMethodError;
	import me.feng.events.FEventDispatcher;
	import me.feng3d.events.ParserEvent;
	import me.feng3d.parsers.utils.ParserUtil;

	/**
	 * 解析基类
	 * @author feng 2014-5-16
	 */
	public class ParserBase extends FEventDispatcher
	{
		protected static const PARSING_DONE:Boolean = true;
		protected static const MORE_TO_PARSE:Boolean = false;

		protected var _fileName:String;

		protected var _dataFormat:String;
		protected var _data:*;
		protected var _frameLimit:Number;
		protected var _lastFrameTime:Number;

		private var _parsingPaused:Boolean;
		private var _parsingComplete:Boolean;
		/** 是否解析失败 */
		private var _parsingFailure:Boolean;
		private var _timer:Timer;
		/**  */
		private var _materialMode:uint;

		public function ParserBase(format:String)
		{
			_materialMode = 0;
			_dataFormat = format;
			AbstractClassError.check(this);
		}

		protected function getTextData():String
		{
			return ParserUtil.toString(_data);
		}

		protected function getByteData():ByteArray
		{
			return ParserUtil.toByteArray(_data);
		}

		public function set materialMode(newMaterialMode:uint):void
		{
			_materialMode = newMaterialMode;
		}

		public function get materialMode():uint
		{
			return _materialMode;
		}

		/** 数据格式 */
		public function get dataFormat():String
		{
			return _dataFormat;
		}

		/**
		 * 是否在解析中
		 */
		protected function proceedParsing():Boolean
		{
			throw new AbstractMethodError();
		}

		/**
		 * 是否暂停解析
		 */
		public function get parsingPaused():Boolean
		{
			return _parsingPaused;
		}

		/**
		 * 是否解析完成
		 */
		public function get parsingComplete():Boolean
		{
			return _parsingComplete;
		}

		/**
		 * 异步解析数据
		 * @param data 数据
		 * @param frameLimit 帧时间限制
		 */
		public function parseAsync(data:*, frameLimit:Number = 30):void
		{
			_data = data;
			startParsing(frameLimit);
		}

		/**
		 * 是否还有时间
		 */
		protected function hasTime():Boolean
		{
			return ((getTimer() - _lastFrameTime) < _frameLimit);
		}

		/**
		 * 开始解析数据
		 * @param frameLimit 帧时间限制
		 */
		protected function startParsing(frameLimit:Number):void
		{
			_frameLimit = frameLimit;
			_timer = new Timer(_frameLimit, 0);
			_timer.addEventListener(TimerEvent.TIMER, onInterval);
			_timer.start();
		}

		/**
		 * 触发解析
		 * @param event
		 */
		protected function onInterval(event:TimerEvent = null):void
		{
			_lastFrameTime = getTimer();
			if (proceedParsing() && !_parsingFailure)
				finishParsing();
		}

		/**
		 * 完成解析
		 */
		protected function finishParsing():void
		{
			if (_timer)
			{
				_timer.removeEventListener(TimerEvent.TIMER, onInterval);
				_timer.stop();
			}
			_timer = null;
			_parsingComplete = true;
			dispatchEvent(new ParserEvent(ParserEvent.PARSE_COMPLETE));
		}
	}
}
