module LLVM.Wrapper.BitWriter where

import Foreign.C.String
import Control.Monad

import qualified LLVM.FFI.BitWriter as FFI
import LLVM.FFI.Core

writeBitcodeToFile :: ModuleRef -> FilePath -> IO ()
writeBitcodeToFile m p = do result <- withCAString p (FFI.writeBitcodeToFile m)
                            unless (result == 0) $
                                   fail $ "Failed to write bitcode to " ++ p
