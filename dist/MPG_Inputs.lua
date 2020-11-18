-----------------------------------------------------------------------------
--   Name: PMC Module
--Created: 03/27/2015
-----------------------------------------------------------------------------
-- This is auto-generated code from PmcEditor. Do not edit this file! Go
-- back to the ladder diagram source for changes in the logic

-- U_xxx symbols correspond to user-defined names. There is such a symbol
-- for every internal relay, variable, timer, and so on in the ladder
-- program. I_xxx symbols are internally generated.

local MPG_Inputs = {}

local pmcvars = {} -- One local variable to conatain all pmc generated variables

local hIo, hReg, hSig, rc

-- Generated function for MachAPI.
local function Read_Register(mInst, path)
    local value
    if (path:find('AnalogInput/')) then
        local index = string.gsub(path, 'AnalogInput/', '')
        index = tonumber(index)
        value, rc = mc.mcAnalogInputRead(mInst, index)
        if (rc == mc.MERROR_NOERROR) then
            return value
        end
    elseif (path:find('AnalogOutput/')) then
        local index = string.gsub(path, 'AnalogOutput/', '')
        index = tonumber(index)
        value, rc = mc.mcAnalogOutputRead(mInst, index)
        if (rc == mc.MERROR_NOERROR) then
            return value
        end
    else
        hReg, rc = mc.mcRegGetHandle(mInst, path)
        if (rc == mc.MERROR_NOERROR) then
            value, rc = mc.mcRegGetValue(hReg)
            if (rc == mc.MERROR_NOERROR) then
                return value
            end
        end
    end
    return 0
end

-- Generated function for MachAPI.
local function Write_Register(mInst, path, value)
    if (path:find('AnalogOutput/')) then
        local index = string.gsub(path, 'AnalogOutput/', '')
        index = tonumber(index)
        rc = mc.mcAnalogOutputWrite(mInst, index, value)
        if (rc == mc.MERROR_NOERROR) then
            return
        end
    else
        hReg, rc = mc.mcRegGetHandle(mInst, path)
        if (rc == mc.MERROR_NOERROR) then
            rc = mc.mcRegSetValue(hReg, value)
            if (rc == mc.MERROR_NOERROR) then
                return
            end
        end
    end
    return
end

-- Generated function for MachAPI.
local function Read_Signal(mInst, path)
    hSig = 0
    rc = mc.MERROR_NOERROR
    hSig, rc = mc.mcSignalGetHandle(mInst, path)
    if (rc == mc.MERROR_NOERROR) then
        local state = 0;
        state, rc = mc.mcSignalGetState(hSig)
        if (rc == mc.MERROR_NOERROR) then
            return state
        end
    end
    return 0
end

-- Generated function for MachAPI.
local function Write_Signal(mInst, path, v)
    hSig = 0
    rc = mc.MERROR_NOERROR
    hSig, rc = mc.mcSignalGetHandle(mInst, path)
    if (rc == mc.MERROR_NOERROR) then
        mc.mcSignalSetState(hSig, v)
    end
end

-- Generated function for MachAPI.
local function Read_Io(mInst, path)
    hIo = 0
    rc = mc.MERROR_NOERROR
    hIo, rc = mc.mcIoGetHandle(mInst, path)
    if (rc == mc.MERROR_NOERROR) then
        local state = 0
        state, rc = mc.mcIoGetState(hIo)
        if (rc == mc.MERROR_NOERROR) then
            return state
        end
    end
    return 0
end

-- Generated function for MachAPI.
local function Write_Io(mInst, path, v)
    hIo, rc = mc.mcIoGetHandle(mInst, path)
    if (rc == mc.MERROR_NOERROR) then
        mc.mcIoSetState(hIo, v)
    end
end

-- Generated function for MachAPI.
local function JogStart(mInst, axis, dir)
    local type = 0
    type, rc = mc.mcJogGetType(mInst, axis)
    if (rc == mc.MERROR_NOERROR) then
        if (type == 0) then -- velocity
            mc.mcJogVelocityStart(mInst, axis, dir)
        else                -- incremental
            local inc = 0
            inc, rc = mc.mcJogGetInc(mInst, axis)
            if (rc == mc.MERROR_NOERROR) then
                inc = inc * dir
                mc.mcJogIncStart(mInst, axis, inc)
            end
        end
    end
end
local function JogStop(mInst, axis)
    local type = 0
    type, rc = mc.mcJogGetType(mInst, axis)
    if (rc == mc.MERROR_NOERROR) then
        if (type == 0) then -- velocity
            mc.mcJogVelocityStop(mInst, axis)
        end
    end
end

pmcvars.I_b_mcr = 0
local function Read_I_b_mcr() return pmcvars.I_b_mcr; end
local function Write_I_b_mcr(x) pmcvars.I_b_mcr = x; end
pmcvars.I_b_rung_top = 0
local function Read_I_b_rung_top() return pmcvars.I_b_rung_top; end
local function Write_I_b_rung_top(x) pmcvars.I_b_rung_top = x; end
pmcvars.U_d_MPGX = 0

-- Generated function for signal read.
local function Read_U_b_GMPGX()
    return Read_Signal(0, 55)
end

-- Generated function for signal write.
local function Write_U_b_GMPGX(v)
    Write_Signal(0, 55, v)
end
pmcvars.U_d_MPGY = 0

-- Generated function for signal read.
local function Read_U_b_GMPGY()
    return Read_Signal(0, 56)
end

-- Generated function for signal write.
local function Write_U_b_GMPGY(v)
    Write_Signal(0, 56, v)
end
pmcvars.U_d_MPGZ = 0

-- Generated function for signal read.
local function Read_U_b_GMPGZ()
    return Read_Signal(0, 57)
end

-- Generated function for signal write.
local function Write_U_b_GMPGZ(v)
    Write_Signal(0, 57, v)
end
pmcvars.U_d_MPGA = 0

-- Generated function for signal read.
local function Read_U_b_GMPGA()
    return Read_Signal(0, 58)
end

-- Generated function for signal write.
local function Write_U_b_GMPGA(v)
    Write_Signal(0, 58, v)
end

-- Generated function for signal read.
local function Read_U_b_GMPGB()
    return Read_Signal(0, 59)
end

-- Generated function for signal write.
local function Write_U_b_GMPGB(v)
    Write_Signal(0, 59, v)
end
pmcvars.U_d_MPGB = 0

-- Generated function for signal read.
local function Read_U_b_GMPGC()
    return Read_Signal(0, 60)
end

-- Generated function for signal write.
local function Write_U_b_GMPGC(v)
    Write_Signal(0, 60, v)
end
pmcvars.U_d_MPGC = 0

-- Generated function for signal read.
local function Read_U_b_GMPGInc1()
    return Read_Signal(0, 62)
end

-- Generated function for signal write.
local function Write_U_b_GMPGInc1(v)
    Write_Signal(0, 62, v)
end
pmcvars.U_d_MPGInc1 = 0

-- Generated function for signal read.
local function Read_U_b_GMPGInc2()
    return Read_Signal(0, 63)
end

-- Generated function for signal write.
local function Write_U_b_GMPGInc2(v)
    Write_Signal(0, 63, v)
end
pmcvars.U_d_MPGInc2 = 0

-- Generated function for signal read.
local function Read_U_b_GMPGInc3()
    return Read_Signal(0, 64)
end

-- Generated function for signal write.
local function Write_U_b_GMPGInc3(v)
    Write_Signal(0, 64, v)
end
pmcvars.U_d_MPGInc3 = 0

-- Generated function for signal read.
local function Read_U_b_GMPGEn()
    return Read_Signal(0, 61)
end

-- Generated function for signal write.
local function Write_U_b_GMPGEn(v)
    Write_Signal(0, 61, v)
end
pmcvars.U_d_MPGEn = 0


-- Call this function to retrieve the PMC cycle time interval
-- that you specified in the PmcEditor.
function MPG_Inputs.GetCycleInterval()
    return 10
end


-- Call this function once per PLC cycle. You are responsible for calling
-- it at the interval that you specified in the MCU configuration when you
-- generated this code. */
function MPG_Inputs.PlcCycle()
    Write_I_b_mcr(1)
    
    -- start rung 1
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_I_b_rung_top() == 1) then
        pmcvars.U_d_MPGX = 0
    end
    
    -- ] finish series
    
    -- start rung 2
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_U_b_GMPGX() == 0) then
        Write_I_b_rung_top(0)
    end
    
    if(Read_I_b_rung_top() == 1) then
        pmcvars.U_d_MPGX = 1
    end
    
    -- ] finish series
    
    -- start rung 3
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_I_b_rung_top() == 1) then
        Write_Register(0, "gRegs0/mpgXAxis", pmcvars.U_d_MPGX)
    end
    
    -- ] finish series
    
    -- start rung 4
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_I_b_rung_top() == 1) then
        pmcvars.U_d_MPGY = 0
    end
    
    -- ] finish series
    
    -- start rung 5
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_U_b_GMPGY() == 0) then
        Write_I_b_rung_top(0)
    end
    
    if(Read_I_b_rung_top() == 1) then
        pmcvars.U_d_MPGY = 1
    end
    
    -- ] finish series
    
    -- start rung 6
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_I_b_rung_top() == 1) then
        Write_Register(0, "gRegs0/mpgYAxis", pmcvars.U_d_MPGY)
    end
    
    -- ] finish series
    
    -- start rung 7
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_I_b_rung_top() == 1) then
        pmcvars.U_d_MPGZ = 0
    end
    
    -- ] finish series
    
    -- start rung 8
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_U_b_GMPGZ() == 0) then
        Write_I_b_rung_top(0)
    end
    
    if(Read_I_b_rung_top() == 1) then
        pmcvars.U_d_MPGZ = 1
    end
    
    -- ] finish series
    
    -- start rung 9
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_I_b_rung_top() == 1) then
        Write_Register(0, "gRegs0/mpgZAxis", pmcvars.U_d_MPGZ)
    end
    
    -- ] finish series
    
    -- start rung 10
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_I_b_rung_top() == 1) then
        pmcvars.U_d_MPGA = 0
    end
    
    -- ] finish series
    
    -- start rung 11
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_U_b_GMPGA() == 0) then
        Write_I_b_rung_top(0)
    end
    
    if(Read_I_b_rung_top() == 1) then
        pmcvars.U_d_MPGA = 1
    end
    
    -- ] finish series
    
    -- start rung 12
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_I_b_rung_top() == 1) then
        Write_Register(0, "gRegs0/mpgAAxis", pmcvars.U_d_MPGA)
    end
    
    -- ] finish series
    
    -- start rung 13
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_U_b_GMPGB() == 0) then
        Write_I_b_rung_top(0)
    end
    
    if(Read_I_b_rung_top() == 1) then
        pmcvars.U_d_MPGB = 1
    end
    
    -- ] finish series
    
    -- start rung 14
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_I_b_rung_top() == 1) then
        Write_Register(0, "gRegs0/mpgBAxis", pmcvars.U_d_MPGB)
    end
    
    -- ] finish series
    
    -- start rung 15
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_U_b_GMPGC() == 0) then
        Write_I_b_rung_top(0)
    end
    
    if(Read_I_b_rung_top() == 1) then
        pmcvars.U_d_MPGC = 1
    end
    
    -- ] finish series
    
    -- start rung 16
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_I_b_rung_top() == 1) then
        Write_Register(0, "gRegs0/mpgCAxis", pmcvars.U_d_MPGC)
    end
    
    -- ] finish series
    
    -- start rung 17
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_U_b_GMPGInc1() == 0) then
        Write_I_b_rung_top(0)
    end
    
    if(Read_I_b_rung_top() == 1) then
        pmcvars.U_d_MPGInc1 = 1
    end
    
    -- ] finish series
    
    -- start rung 18
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_I_b_rung_top() == 1) then
        Write_Register(0, "gRegs0/mpgInc1", pmcvars.U_d_MPGInc1)
    end
    
    -- ] finish series
    
    -- start rung 19
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_U_b_GMPGInc2() == 0) then
        Write_I_b_rung_top(0)
    end
    
    if(Read_I_b_rung_top() == 1) then
        pmcvars.U_d_MPGInc2 = 1
    end
    
    -- ] finish series
    
    -- start rung 20
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_I_b_rung_top() == 1) then
        Write_Register(0, "gRegs0/mpgInc2", pmcvars.U_d_MPGInc2)
    end
    
    -- ] finish series
    
    -- start rung 21
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_U_b_GMPGInc3() == 0) then
        Write_I_b_rung_top(0)
    end
    
    if(Read_I_b_rung_top() == 1) then
        pmcvars.U_d_MPGInc3 = 1
    end
    
    -- ] finish series
    
    -- start rung 22
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_I_b_rung_top() == 1) then
        Write_Register(0, "gRegs0/mpgInc3", pmcvars.U_d_MPGInc3)
    end
    
    -- ] finish series
    
    -- start rung 23
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_U_b_GMPGEn() == 0) then
        Write_I_b_rung_top(0)
    end
    
    if(Read_I_b_rung_top() == 1) then
        pmcvars.U_d_MPGEn = 1
    end
    
    -- ] finish series
    
    -- start rung 24
    Write_I_b_rung_top(Read_I_b_mcr())
    
    -- start series [
    if(Read_I_b_rung_top() == 1) then
        Write_Register(0, "gRegs0/mpgEnable", pmcvars.U_d_MPGEn)
    end
    
    -- ] finish series
end

return MPG_Inputs