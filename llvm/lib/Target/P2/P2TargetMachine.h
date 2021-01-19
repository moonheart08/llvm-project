#ifndef LLVM_LIB_TARGET_P2_P2TARGETMACHINE_H
#define LLVM_LIB_TARGET_P2_P2TARGETMACHINE_H

#include "llvm/IR/DataLayout.h"
#include "llvm/Target/TargetMachine.h"

namespace llvm {
    class StringRef;

    /// P2TargetMachine
    class P2TargetMachine : public LLVMTargetMachine {
        std::unique_ptr<TargetLoweringObjectFile> TLOF;
    public:
        P2TargetMachine(const Target &T, const Triple &TT, StringRef CPU,
                        StringRef FS, const TargetOptions &Options,
                        Optional<Reloc::Model> RM, Optional<CodeModel::Model> CM,
                        CodeGenOpt::Level OL, bool JIT);
        ~P2TargetMachine() override;

        TargetPassConfig *createPassConfig(PassManagerBase &PM) override;

        TargetLoweringObjectFile *getObjFileLowering() const override {
            return TLOF.get();
        }
    };
}

#endif