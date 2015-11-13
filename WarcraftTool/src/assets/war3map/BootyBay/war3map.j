//===========================================================================
// 
// Booty Bay
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Wed May 07 00:20:09 2003
//   Map Author: Blizzard Entertainment
// 
//===========================================================================

//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************

globals
    // Generated
    trigger                 gg_trg_Melee_Initialization = null
endglobals

function InitGlobals takes nothing returns nothing
endfunction

//***************************************************************************
//*
//*  Unit Item Tables
//*
//***************************************************************************

function Unit000011_DropItems takes nothing returns nothing
    local widget  trigWidget = null
    local unit    trigUnit   = null
    local integer itemID     = 0
    local boolean canDrop    = true

    set trigWidget = bj_lastDyingWidget
    if (trigWidget == null) then
        set trigUnit = GetTriggerUnit()
    endif

    if (trigUnit != null) then
        set canDrop = not IsUnitHidden(trigUnit)
        if (canDrop and GetChangingUnit() != null) then
            set canDrop = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
        endif
    endif

    if (canDrop) then
        // Item set 0
        call RandomDistReset(  )
        call RandomDistAddItem( ChooseRandomItemEx( ITEM_TYPE_PERMANENT, 1 ), 100 )
        set itemID = RandomDistChoose(  )
        if (trigUnit != null) then
            call UnitDropItem( trigUnit, itemID )
        else
            call WidgetDropItem( trigWidget, itemID )
        endif

    endif

    set bj_lastDyingWidget = null
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function Unit000014_DropItems takes nothing returns nothing
    local widget  trigWidget = null
    local unit    trigUnit   = null
    local integer itemID     = 0
    local boolean canDrop    = true

    set trigWidget = bj_lastDyingWidget
    if (trigWidget == null) then
        set trigUnit = GetTriggerUnit()
    endif

    if (trigUnit != null) then
        set canDrop = not IsUnitHidden(trigUnit)
        if (canDrop and GetChangingUnit() != null) then
            set canDrop = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
        endif
    endif

    if (canDrop) then
        // Item set 0
        call RandomDistReset(  )
        call RandomDistAddItem( ChooseRandomItemEx( ITEM_TYPE_POWERUP, 2 ), 100 )
        set itemID = RandomDistChoose(  )
        if (trigUnit != null) then
            call UnitDropItem( trigUnit, itemID )
        else
            call WidgetDropItem( trigWidget, itemID )
        endif

    endif

    set bj_lastDyingWidget = null
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function Unit000015_DropItems takes nothing returns nothing
    local widget  trigWidget = null
    local unit    trigUnit   = null
    local integer itemID     = 0
    local boolean canDrop    = true

    set trigWidget = bj_lastDyingWidget
    if (trigWidget == null) then
        set trigUnit = GetTriggerUnit()
    endif

    if (trigUnit != null) then
        set canDrop = not IsUnitHidden(trigUnit)
        if (canDrop and GetChangingUnit() != null) then
            set canDrop = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
        endif
    endif

    if (canDrop) then
        // Item set 0
        call RandomDistReset(  )
        call RandomDistAddItem( ChooseRandomItemEx( ITEM_TYPE_CHARGED, 2 ), 100 )
        set itemID = RandomDistChoose(  )
        if (trigUnit != null) then
            call UnitDropItem( trigUnit, itemID )
        else
            call WidgetDropItem( trigWidget, itemID )
        endif

    endif

    set bj_lastDyingWidget = null
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function Unit000018_DropItems takes nothing returns nothing
    local widget  trigWidget = null
    local unit    trigUnit   = null
    local integer itemID     = 0
    local boolean canDrop    = true

    set trigWidget = bj_lastDyingWidget
    if (trigWidget == null) then
        set trigUnit = GetTriggerUnit()
    endif

    if (trigUnit != null) then
        set canDrop = not IsUnitHidden(trigUnit)
        if (canDrop and GetChangingUnit() != null) then
            set canDrop = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
        endif
    endif

    if (canDrop) then
        // Item set 0
        call RandomDistReset(  )
        call RandomDistAddItem( ChooseRandomItemEx( ITEM_TYPE_CHARGED, 4 ), 100 )
        set itemID = RandomDistChoose(  )
        if (trigUnit != null) then
            call UnitDropItem( trigUnit, itemID )
        else
            call WidgetDropItem( trigWidget, itemID )
        endif

    endif

    set bj_lastDyingWidget = null
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function Unit000022_DropItems takes nothing returns nothing
    local widget  trigWidget = null
    local unit    trigUnit   = null
    local integer itemID     = 0
    local boolean canDrop    = true

    set trigWidget = bj_lastDyingWidget
    if (trigWidget == null) then
        set trigUnit = GetTriggerUnit()
    endif

    if (trigUnit != null) then
        set canDrop = not IsUnitHidden(trigUnit)
        if (canDrop and GetChangingUnit() != null) then
            set canDrop = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
        endif
    endif

    if (canDrop) then
        // Item set 0
        call RandomDistReset(  )
        call RandomDistAddItem( ChooseRandomItemEx( ITEM_TYPE_PERMANENT, 2 ), 100 )
        set itemID = RandomDistChoose(  )
        if (trigUnit != null) then
            call UnitDropItem( trigUnit, itemID )
        else
            call WidgetDropItem( trigWidget, itemID )
        endif

    endif

    set bj_lastDyingWidget = null
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function Unit000023_DropItems takes nothing returns nothing
    local widget  trigWidget = null
    local unit    trigUnit   = null
    local integer itemID     = 0
    local boolean canDrop    = true

    set trigWidget = bj_lastDyingWidget
    if (trigWidget == null) then
        set trigUnit = GetTriggerUnit()
    endif

    if (trigUnit != null) then
        set canDrop = not IsUnitHidden(trigUnit)
        if (canDrop and GetChangingUnit() != null) then
            set canDrop = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
        endif
    endif

    if (canDrop) then
        // Item set 0
        call RandomDistReset(  )
        call RandomDistAddItem( ChooseRandomItemEx( ITEM_TYPE_PERMANENT, 3 ), 100 )
        set itemID = RandomDistChoose(  )
        if (trigUnit != null) then
            call UnitDropItem( trigUnit, itemID )
        else
            call WidgetDropItem( trigWidget, itemID )
        endif

    endif

    set bj_lastDyingWidget = null
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function Unit000026_DropItems takes nothing returns nothing
    local widget  trigWidget = null
    local unit    trigUnit   = null
    local integer itemID     = 0
    local boolean canDrop    = true

    set trigWidget = bj_lastDyingWidget
    if (trigWidget == null) then
        set trigUnit = GetTriggerUnit()
    endif

    if (trigUnit != null) then
        set canDrop = not IsUnitHidden(trigUnit)
        if (canDrop and GetChangingUnit() != null) then
            set canDrop = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
        endif
    endif

    if (canDrop) then
        // Item set 0
        call RandomDistReset(  )
        call RandomDistAddItem( ChooseRandomItemEx( ITEM_TYPE_PERMANENT, 3 ), 100 )
        set itemID = RandomDistChoose(  )
        if (trigUnit != null) then
            call UnitDropItem( trigUnit, itemID )
        else
            call WidgetDropItem( trigWidget, itemID )
        endif

    endif

    set bj_lastDyingWidget = null
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function Unit000038_DropItems takes nothing returns nothing
    local widget  trigWidget = null
    local unit    trigUnit   = null
    local integer itemID     = 0
    local boolean canDrop    = true

    set trigWidget = bj_lastDyingWidget
    if (trigWidget == null) then
        set trigUnit = GetTriggerUnit()
    endif

    if (trigUnit != null) then
        set canDrop = not IsUnitHidden(trigUnit)
        if (canDrop and GetChangingUnit() != null) then
            set canDrop = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
        endif
    endif

    if (canDrop) then
        // Item set 0
        call RandomDistReset(  )
        call RandomDistAddItem( ChooseRandomItemEx( ITEM_TYPE_POWERUP, 1 ), 100 )
        set itemID = RandomDistChoose(  )
        if (trigUnit != null) then
            call UnitDropItem( trigUnit, itemID )
        else
            call WidgetDropItem( trigWidget, itemID )
        endif

    endif

    set bj_lastDyingWidget = null
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function Unit000039_DropItems takes nothing returns nothing
    local widget  trigWidget = null
    local unit    trigUnit   = null
    local integer itemID     = 0
    local boolean canDrop    = true

    set trigWidget = bj_lastDyingWidget
    if (trigWidget == null) then
        set trigUnit = GetTriggerUnit()
    endif

    if (trigUnit != null) then
        set canDrop = not IsUnitHidden(trigUnit)
        if (canDrop and GetChangingUnit() != null) then
            set canDrop = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
        endif
    endif

    if (canDrop) then
        // Item set 0
        call RandomDistReset(  )
        call RandomDistAddItem( ChooseRandomItemEx( ITEM_TYPE_PERMANENT, 2 ), 100 )
        set itemID = RandomDistChoose(  )
        if (trigUnit != null) then
            call UnitDropItem( trigUnit, itemID )
        else
            call WidgetDropItem( trigWidget, itemID )
        endif

    endif

    set bj_lastDyingWidget = null
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function Unit000042_DropItems takes nothing returns nothing
    local widget  trigWidget = null
    local unit    trigUnit   = null
    local integer itemID     = 0
    local boolean canDrop    = true

    set trigWidget = bj_lastDyingWidget
    if (trigWidget == null) then
        set trigUnit = GetTriggerUnit()
    endif

    if (trigUnit != null) then
        set canDrop = not IsUnitHidden(trigUnit)
        if (canDrop and GetChangingUnit() != null) then
            set canDrop = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
        endif
    endif

    if (canDrop) then
        // Item set 0
        call RandomDistReset(  )
        call RandomDistAddItem( ChooseRandomItemEx( ITEM_TYPE_CHARGED, 3 ), 100 )
        set itemID = RandomDistChoose(  )
        if (trigUnit != null) then
            call UnitDropItem( trigUnit, itemID )
        else
            call WidgetDropItem( trigWidget, itemID )
        endif

    endif

    set bj_lastDyingWidget = null
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function Unit000056_DropItems takes nothing returns nothing
    local widget  trigWidget = null
    local unit    trigUnit   = null
    local integer itemID     = 0
    local boolean canDrop    = true

    set trigWidget = bj_lastDyingWidget
    if (trigWidget == null) then
        set trigUnit = GetTriggerUnit()
    endif

    if (trigUnit != null) then
        set canDrop = not IsUnitHidden(trigUnit)
        if (canDrop and GetChangingUnit() != null) then
            set canDrop = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
        endif
    endif

    if (canDrop) then
        // Item set 0
        call RandomDistReset(  )
        call RandomDistAddItem( ChooseRandomItemEx( ITEM_TYPE_POWERUP, 1 ), 100 )
        set itemID = RandomDistChoose(  )
        if (trigUnit != null) then
            call UnitDropItem( trigUnit, itemID )
        else
            call WidgetDropItem( trigWidget, itemID )
        endif

    endif

    set bj_lastDyingWidget = null
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function Unit000059_DropItems takes nothing returns nothing
    local widget  trigWidget = null
    local unit    trigUnit   = null
    local integer itemID     = 0
    local boolean canDrop    = true

    set trigWidget = bj_lastDyingWidget
    if (trigWidget == null) then
        set trigUnit = GetTriggerUnit()
    endif

    if (trigUnit != null) then
        set canDrop = not IsUnitHidden(trigUnit)
        if (canDrop and GetChangingUnit() != null) then
            set canDrop = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
        endif
    endif

    if (canDrop) then
        // Item set 0
        call RandomDistReset(  )
        call RandomDistAddItem( ChooseRandomItemEx( ITEM_TYPE_CHARGED, 3 ), 100 )
        set itemID = RandomDistChoose(  )
        if (trigUnit != null) then
            call UnitDropItem( trigUnit, itemID )
        else
            call WidgetDropItem( trigWidget, itemID )
        endif

    endif

    set bj_lastDyingWidget = null
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function Unit000060_DropItems takes nothing returns nothing
    local widget  trigWidget = null
    local unit    trigUnit   = null
    local integer itemID     = 0
    local boolean canDrop    = true

    set trigWidget = bj_lastDyingWidget
    if (trigWidget == null) then
        set trigUnit = GetTriggerUnit()
    endif

    if (trigUnit != null) then
        set canDrop = not IsUnitHidden(trigUnit)
        if (canDrop and GetChangingUnit() != null) then
            set canDrop = (GetChangingUnitPrevOwner() == Player(PLAYER_NEUTRAL_AGGRESSIVE))
        endif
    endif

    if (canDrop) then
        // Item set 0
        call RandomDistReset(  )
        call RandomDistAddItem( ChooseRandomItemEx( ITEM_TYPE_PERMANENT, 1 ), 100 )
        set itemID = RandomDistChoose(  )
        if (trigUnit != null) then
            call UnitDropItem( trigUnit, itemID )
        else
            call WidgetDropItem( trigWidget, itemID )
        endif

    endif

    set bj_lastDyingWidget = null
    call DestroyTrigger(GetTriggeringTrigger())
endfunction


//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************

//===========================================================================
function CreateNeutralHostile takes nothing returns nothing
    local player p = Player(PLAYER_NEUTRAL_AGGRESSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u = CreateUnit( p, 'ngns', 3599.4, 2077.1, 160.937 )
    set u = CreateUnit( p, 'nftk', -263.4, -2508.8, 245.420 )
    call SetUnitAcquireRange( u, 200.0 )
    set t = CreateTrigger(  )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_DEATH )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_CHANGE_OWNER )
    call TriggerAddAction( t, function Unit000018_DropItems )
    set u = CreateUnit( p, 'nftr', -438.9, -2488.1, 24.786 )
    call SetUnitAcquireRange( u, 200.0 )
    set u = CreateUnit( p, 'nftr', -73.5, -2507.4, 172.675 )
    call SetUnitAcquireRange( u, 200.0 )
    set u = CreateUnit( p, 'nftb', -520.7, -2265.8, 298.530 )
    call SetUnitAcquireRange( u, 200.0 )
    set u = CreateUnit( p, 'nftb', 28.7, -2310.5, 72.620 )
    call SetUnitAcquireRange( u, 200.0 )
    set t = CreateTrigger(  )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_DEATH )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_CHANGE_OWNER )
    call TriggerAddAction( t, function Unit000014_DropItems )
    set u = CreateUnit( p, 'nogl', -291.1, 1.3, 261.250 )
    call SetUnitState( u, UNIT_STATE_MANA, 0 )
    call SetUnitAcquireRange( u, 200.0 )
    set t = CreateTrigger(  )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_DEATH )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_CHANGE_OWNER )
    call TriggerAddAction( t, function Unit000015_DropItems )
    set u = CreateUnit( p, 'nogr', -514.1, 14.0, 237.974 )
    call SetUnitAcquireRange( u, 200.0 )
    set u = CreateUnit( p, 'nogr', -130.3, 11.9, 297.226 )
    call SetUnitAcquireRange( u, 200.0 )
    set u = CreateUnit( p, 'nfsh', 9495.5, -3458.4, 138.250 )
    call SetUnitState( u, UNIT_STATE_MANA, 0 )
    call SetUnitAcquireRange( u, 200.0 )
    call IssueImmediateOrder( u, "autodispeloff" )
    call IssueImmediateOrder( u, "healoff" )
    call IssueImmediateOrder( u, "innerfireoff" )
    set t = CreateTrigger(  )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_DEATH )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_CHANGE_OWNER )
    call TriggerAddAction( t, function Unit000022_DropItems )
    set u = CreateUnit( p, 'nfsp', 3886.2, -518.7, -40.470 )
    call SetUnitState( u, UNIT_STATE_MANA, 0 )
    call IssueImmediateOrder( u, "autodispeloff" )
    call IssueImmediateOrder( u, "healoff" )
    set t = CreateTrigger(  )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_DEATH )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_CHANGE_OWNER )
    call TriggerAddAction( t, function Unit000056_DropItems )
    set u = CreateUnit( p, 'nftr', 9523.1, -3195.7, 166.668 )
    call SetUnitAcquireRange( u, 200.0 )
    set u = CreateUnit( p, 'nftr', 9201.8, -3471.8, 107.121 )
    call SetUnitAcquireRange( u, 200.0 )
    set u = CreateUnit( p, 'nfsh', -9421.2, -3543.7, 44.124 )
    call SetUnitState( u, UNIT_STATE_MANA, 0 )
    call SetUnitAcquireRange( u, 200.0 )
    call IssueImmediateOrder( u, "autodispeloff" )
    call IssueImmediateOrder( u, "healoff" )
    call IssueImmediateOrder( u, "innerfireoff" )
    set t = CreateTrigger(  )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_DEATH )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_CHANGE_OWNER )
    call TriggerAddAction( t, function Unit000039_DropItems )
    set u = CreateUnit( p, 'nftt', -4717.3, -389.5, 263.855 )
    set u = CreateUnit( p, 'nftr', -9177.0, -3660.9, 65.053 )
    call SetUnitAcquireRange( u, 200.0 )
    set u = CreateUnit( p, 'nftr', -9382.7, -3290.6, 11.183 )
    call SetUnitAcquireRange( u, 200.0 )
    set u = CreateUnit( p, 'nftb', 4129.5, -336.7, -61.089 )
    set u = CreateUnit( p, 'nfsp', 3871.8, -768.9, -24.628 )
    call SetUnitState( u, UNIT_STATE_MANA, 0 )
    call IssueImmediateOrder( u, "autodispeloff" )
    call IssueImmediateOrder( u, "healoff" )
    set u = CreateUnit( p, 'nftb', 4097.2, -863.3, -25.581 )
    set t = CreateTrigger(  )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_DEATH )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_CHANGE_OWNER )
    call TriggerAddAction( t, function Unit000059_DropItems )
    set u = CreateUnit( p, 'nftt', 4023.1, -613.3, -41.877 )
    set u = CreateUnit( p, 'nggr', 3389.1, 2173.5, 0.000 )
    call SetUnitState( u, UNIT_STATE_MANA, 0 )
    set t = CreateTrigger(  )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_DEATH )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_CHANGE_OWNER )
    call TriggerAddAction( t, function Unit000026_DropItems )
    set u = CreateUnit( p, 'ngnb', 4510.8, -4711.8, 72.915 )
    call SetUnitAcquireRange( u, 200.0 )
    set t = CreateTrigger(  )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_DEATH )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_CHANGE_OWNER )
    call TriggerAddAction( t, function Unit000060_DropItems )
    set u = CreateUnit( p, 'ngns', 3420.8, 2474.1, 207.260 )
    set u = CreateUnit( p, 'nggr', -2967.2, 2003.0, 0.000 )
    call SetUnitState( u, UNIT_STATE_MANA, 0 )
    set t = CreateTrigger(  )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_DEATH )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_CHANGE_OWNER )
    call TriggerAddAction( t, function Unit000023_DropItems )
    set u = CreateUnit( p, 'ngns', -3027.2, 1728.3, 23.175 )
    set u = CreateUnit( p, 'ngns', -3145.0, 2239.4, -24.777 )
    set u = CreateUnit( p, 'ngna', -6809.4, -4459.9, 116.744 )
    call SetUnitAcquireRange( u, 200.0 )
    set u = CreateUnit( p, 'ngna', -6906.4, -4600.6, 99.395 )
    call SetUnitAcquireRange( u, 200.0 )
    set u = CreateUnit( p, 'nfsp', -4627.5, -249.4, 257.440 )
    call SetUnitState( u, UNIT_STATE_MANA, 0 )
    call IssueImmediateOrder( u, "autodispeloff" )
    call IssueImmediateOrder( u, "healoff" )
    set t = CreateTrigger(  )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_DEATH )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_CHANGE_OWNER )
    call TriggerAddAction( t, function Unit000038_DropItems )
    set u = CreateUnit( p, 'nftb', -4437.3, -486.5, 242.301 )
    set u = CreateUnit( p, 'nftb', -4964.7, -472.0, 286.570 )
    set t = CreateTrigger(  )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_DEATH )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_CHANGE_OWNER )
    call TriggerAddAction( t, function Unit000042_DropItems )
    set u = CreateUnit( p, 'nfsp', -4877.9, -243.5, 0.000 )
    call SetUnitState( u, UNIT_STATE_MANA, 0 )
    call IssueImmediateOrder( u, "autodispeloff" )
    call IssueImmediateOrder( u, "healoff" )
    set u = CreateUnit( p, 'ngnb', -6999.1, -4406.9, 92.930 )
    call SetUnitAcquireRange( u, 200.0 )
    set t = CreateTrigger(  )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_DEATH )
    call TriggerRegisterUnitEvent( t, u, EVENT_UNIT_CHANGE_OWNER )
    call TriggerAddAction( t, function Unit000011_DropItems )
    set u = CreateUnit( p, 'ngna', 4478.0, -4819.3, 47.402 )
    call SetUnitAcquireRange( u, 200.0 )
    set u = CreateUnit( p, 'ngna', 4400.0, -4699.5, 344.160 )
    call SetUnitAcquireRange( u, 200.0 )
endfunction

//===========================================================================
function CreateNeutralPassiveBuildings takes nothing returns nothing
    local player p = Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u = CreateUnit( p, 'ngad', -320.0, 256.0, 270.000 )
    set u = CreateUnit( p, 'nmoo', -256.0, -2240.0, 270.000 )
    set u = CreateUnit( p, 'ngol', -7936.0, 2432.0, 270.000 )
    call SetResourceAmount( u, 12500 )
    set u = CreateUnit( p, 'ngol', 9216.0, 2048.0, 270.000 )
    call SetResourceAmount( u, 12500 )
    set u = CreateUnit( p, 'ngol', 3584.0, -640.0, 270.000 )
    call SetResourceAmount( u, 12500 )
    set u = CreateUnit( p, 'ngol', -4736.0, 0.0, 270.000 )
    call SetResourceAmount( u, 12500 )
    set u = CreateUnit( p, 'ngol', -3328.0, 1920.0, 270.000 )
    call SetResourceAmount( u, 12500 )
    set u = CreateUnit( p, 'ngol', 3712.0, 2432.0, 270.000 )
    call SetResourceAmount( u, 12500 )
endfunction

//===========================================================================
function CreateNeutralPassive takes nothing returns nothing
    local player p = Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life

    set u = CreateUnit( p, 'nvlw', 1091.4, -4983.9, 64.338 )
    set u = CreateUnit( p, 'nshe', 1183.4, -4875.2, 136.762 )
    set u = CreateUnit( p, 'nshe', 1121.9, -4881.8, 279.523 )
    set u = CreateUnit( p, 'nshe', 1152.1, -4810.7, 144.398 )
    set u = CreateUnit( p, 'nshe', 1249.5, -4840.5, 219.360 )
    set u = CreateUnit( p, 'nshe', 1234.1, -4886.9, 116.151 )
    set u = CreateUnit( p, 'nshe', 1179.0, -4921.2, 308.319 )
    set u = CreateUnit( p, 'nshe', 1307.7, -4869.4, 238.477 )
    set u = CreateUnit( p, 'nshe', 1213.9, -4783.3, 51.374 )
    set u = CreateUnit( p, 'npig', -5581.7, -4548.9, 256.495 )
    set u = CreateUnit( p, 'npig', -5719.4, -4560.2, 118.249 )
    set u = CreateUnit( p, 'npig', -5627.1, -4500.0, 106.373 )
    set u = CreateUnit( p, 'npig', -5631.6, -4552.5, 246.684 )
    set u = CreateUnit( p, 'npig', -5502.5, -4454.7, 290.432 )
    set u = CreateUnit( p, 'npig', -5778.7, -4561.3, 80.675 )
endfunction

//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
endfunction

//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
endfunction

//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreateNeutralPassiveBuildings(  )
    call CreatePlayerBuildings(  )
    call CreateNeutralHostile(  )
    call CreateNeutralPassive(  )
    call CreatePlayerUnits(  )
endfunction

//***************************************************************************
//*
//*  Triggers
//*
//***************************************************************************

//===========================================================================
// Trigger: Melee Initialization
//
// Default melee game initialization for all players
//===========================================================================
function Trig_Melee_Initialization_Actions takes nothing returns nothing
    call MeleeStartingVisibility(  )
    call MeleeStartingHeroLimit(  )
    call MeleeGrantHeroItems(  )
    call MeleeStartingResources(  )
    call MeleeClearExcessUnits(  )
    call MeleeStartingUnits(  )
    call MeleeStartingAI(  )
    call MeleeInitVictoryDefeat(  )
endfunction

//===========================================================================
function InitTrig_Melee_Initialization takes nothing returns nothing
    set gg_trg_Melee_Initialization = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Melee_Initialization, function Trig_Melee_Initialization_Actions )
endfunction

//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    call InitTrig_Melee_Initialization(  )
endfunction

//===========================================================================
function RunInitializationTriggers takes nothing returns nothing
    call ConditionalTriggerExecute( gg_trg_Melee_Initialization )
endfunction

//***************************************************************************
//*
//*  Players
//*
//***************************************************************************

function InitCustomPlayerSlots takes nothing returns nothing

    // Player 0
    call SetPlayerStartLocation( Player(0), 0 )
    call SetPlayerColor( Player(0), ConvertPlayerColor(0) )
    call SetPlayerRacePreference( Player(0), RACE_PREF_HUMAN )
    call SetPlayerRaceSelectable( Player(0), true )
    call SetPlayerController( Player(0), MAP_CONTROL_USER )

    // Player 1
    call SetPlayerStartLocation( Player(1), 1 )
    call SetPlayerColor( Player(1), ConvertPlayerColor(1) )
    call SetPlayerRacePreference( Player(1), RACE_PREF_ORC )
    call SetPlayerRaceSelectable( Player(1), true )
    call SetPlayerController( Player(1), MAP_CONTROL_USER )

endfunction

function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_002
    call SetPlayerTeam( Player(0), 0 )
    call SetPlayerTeam( Player(1), 0 )

endfunction

function InitAllyPriorities takes nothing returns nothing

    call SetStartLocPrioCount( 0, 1 )
    call SetStartLocPrio( 0, 0, 1, MAP_LOC_PRIO_HIGH )

    call SetStartLocPrioCount( 1, 1 )
    call SetStartLocPrio( 1, 0, 0, MAP_LOC_PRIO_HIGH )
endfunction

//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************

//===========================================================================
function main takes nothing returns nothing
    call SetCameraBounds( -10240.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -5376.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 10240.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 3840.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -10240.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 3840.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 10240.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -5376.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM) )
    call SetDayNightModels( "Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl" )
    call NewSoundEnvironment( "Default" )
    call SetAmbientDaySound( "LordaeronSummerDay" )
    call SetAmbientNightSound( "LordaeronSummerNight" )
    call SetMapMusic( "Music", true, 0 )
    call CreateAllUnits(  )
    call InitBlizzard(  )
    call InitGlobals(  )
    call InitCustomTriggers(  )
    call RunInitializationTriggers(  )

endfunction

//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************

function config takes nothing returns nothing
    call SetMapName( "TRIGSTR_003" )
    call SetMapDescription( "TRIGSTR_005" )
    call SetPlayers( 2 )
    call SetTeams( 2 )
    call SetGamePlacement( MAP_PLACEMENT_TEAMS_TOGETHER )

    call DefineStartLocation( 0, -8384.0, 1792.0 )
    call DefineStartLocation( 1, 8448.0, 2048.0 )

    // Player setup
    call InitCustomPlayerSlots(  )
    call SetPlayerSlotAvailable( Player(0), MAP_CONTROL_USER )
    call SetPlayerSlotAvailable( Player(1), MAP_CONTROL_USER )
    call InitGenericPlayerSlots(  )
    call InitAllyPriorities(  )
endfunction

