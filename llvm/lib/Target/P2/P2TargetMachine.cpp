#include "P2TargetMachine.h"
#include "llvm/CodeGen/TargetLoweringObjectFileImpl.h"
#include "llvm/CodeGen/TargetPassConfig.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeP2Target() {
    RegisterTargetMachine<P2TargetMachine> X(getTheP2Target());
}

static std::string computeDataLayout(const Triple &TT) {
  std::string Ret;

  Ret += "e-p:32:32-i8:8:8-i16:16:16-i32:32:32";

  return Ret;
}

P2TargetMachine::P2TargetMachine(const Target &T, const Triple &TT,
                                 StringRef CPU, StringRef FS,
                                 const TargetOptions &Options,
                                 Optional<Reloc::Model> RM,
                                 Optional<CodeModel::Model> CM,
                                 CodeGenOpt::Level OL, bool JIT)
        : LLVMTargetMachine(T, computeDataLayout(TT), TT, CPU, FS,
                            Options, RM.getValueOr(Reloc::Static),
                            getEffectiveCodeModel(CM, CodeModel::Small),
                            OL),
            TLOF(std::make_unique<TargetLoweringObjectFileELF>()) {
    initAsmInfo();
}

namespace {
class P2PassConfig : public TargetPassConfig {
public:
  P2PassConfig(P2TargetMachine &TM, PassManagerBase &PM)
      : TargetPassConfig(TM, PM) {}

  P2TargetMachine &getP2TargetMachine() const {
    return getTM<P2TargetMachine>();
  }
};

} // namespace

TargetPassConfig *P2TargetMachine::createPassConfig(PassManagerBase &PM) {
  return new P2PassConfig(*this, PM);
}