class P2Reg<bits<9> Enc, string n, list<string> alt = []> : Register<n> {
  field bits<9> Num = Enc;
  let Namespace = "P2";
  let HWEncoding{8 - 0} = Enc;
  let AltNames = alt;
  let DwarfNumbers = [Enc];
}

// TODO: Maybe expose the fact you can read/write words, bytes, and nibbles
//       from the regfile to LLVM. This would mean declaring another 7168
//       registers however. 1024 word regs, 2048 byte regs, 4096 nibble regs.

// P2 regfile is way too big to specify manually.
foreach i = 0...495 in {
  def R#i : P2Reg<i, "r"#i>, DwarfRegNum<[i]>;
}

// These regs are technically allocatable when interrupts are off. But don't.
def R496 : P2Reg<496, "r496", ["ijmp3"]>;
def R497 : P2Reg<497, "r497", ["iret3"]>;
def R498 : P2Reg<498, "r498", ["ijmp2"]>;
def R499 : P2Reg<499, "r499", ["iret2"]>;
def R500 : P2Reg<500, "r500", ["ijmp1"]>;
def R501 : P2Reg<501, "r501", ["iret1"]>;
def R502 : P2Reg<502, "r502", ["pa"]>;
def R503 : P2Reg<503, "r503", ["pb"]>;

// /Very/ technically reallocatable. Also don't.
def R504 : P2Reg<504, "r504", ["ptra", "sp"]>;
def R505 : P2Reg<505, "r505", ["ptrb"]>;
// Nothing beyond this point is reallocatable. Fixed purpose HW regs.
def R506 : P2Reg<506, "r506", ["dira"]>;
def R507 : P2Reg<507, "r507", ["dirb"]>;
def R508 : P2Reg<508, "r508", ["outa"]>;
def R509 : P2Reg<509, "r509", ["outb"]>;
// 510 and 511 are not writable. Usable as a destination for discarding a result.
// Don't use 511 for this though, it's also used to engage XBYTE and as such may
// have some nasty hardware bugs around using it like this.
def R510 : P2Reg<510, "r510", ["ina"]>;
def R511 : P2Reg<511, "r511", ["inb"]>;

def GR32 : RegisterClass<"P2", [i32], 32,
  (sequence "R%u", 0, 511)>;