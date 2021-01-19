include "llvm/Target/Target.td"

include "P2RegisterInfo.td"
include "P2InstrInfo.td"

def : ProcessorModel<"genericp2", NoSchedModel, []>;

def P2InstrInfo : InstrInfo;

def P2 : Target {
    let InstructionSet = P2InstrInfo;
}