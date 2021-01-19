//===----------------------------------------------------------------------===//
// Instruction formats for the P2
//
// TODO: Document
//===----------------------------------------------------------------------===//


def CondCodeOperand : AsmOperandClass { let Name = "CondCode"; }
def pred : PredicateOperand<OtherVT, (ops i32imm),
                                     (ops (i32 15))> {
  let PrintMethod = "printPredicateOperand";
  let ParserMatchClass = CondCodeOperand;
  let DecoderMethod = "DecodePredicateOperand";
}