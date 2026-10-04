{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_lambda_chan (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/lau/Projects/side_projects/lambda-chan/.stack-work/install/x86_64-linux/d0228518769bf88a05560b1470ed1b3e4fa341bb802eec0201832d713e68c403/9.10.3/bin"
libdir     = "/home/lau/Projects/side_projects/lambda-chan/.stack-work/install/x86_64-linux/d0228518769bf88a05560b1470ed1b3e4fa341bb802eec0201832d713e68c403/9.10.3/lib/x86_64-linux-ghc-9.10.3-415c/lambda-chan-0.1.0.0-5pbjpP9VgcD6SHFy4dTHEP-lambda-chan"
dynlibdir  = "/home/lau/Projects/side_projects/lambda-chan/.stack-work/install/x86_64-linux/d0228518769bf88a05560b1470ed1b3e4fa341bb802eec0201832d713e68c403/9.10.3/lib/x86_64-linux-ghc-9.10.3-415c"
datadir    = "/home/lau/Projects/side_projects/lambda-chan/.stack-work/install/x86_64-linux/d0228518769bf88a05560b1470ed1b3e4fa341bb802eec0201832d713e68c403/9.10.3/share/x86_64-linux-ghc-9.10.3-415c/lambda-chan-0.1.0.0"
libexecdir = "/home/lau/Projects/side_projects/lambda-chan/.stack-work/install/x86_64-linux/d0228518769bf88a05560b1470ed1b3e4fa341bb802eec0201832d713e68c403/9.10.3/libexec/x86_64-linux-ghc-9.10.3-415c/lambda-chan-0.1.0.0"
sysconfdir = "/home/lau/Projects/side_projects/lambda-chan/.stack-work/install/x86_64-linux/d0228518769bf88a05560b1470ed1b3e4fa341bb802eec0201832d713e68c403/9.10.3/etc"

getBinDir     = catchIO (getEnv "lambda_chan_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "lambda_chan_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "lambda_chan_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "lambda_chan_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "lambda_chan_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "lambda_chan_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
