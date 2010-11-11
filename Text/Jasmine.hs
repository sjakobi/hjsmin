module Text.Jasmine
    (       
      minify
    , minifyFile  
    ) where      
    
import Text.Jasmine.Parse
import Text.Jasmine.Pretty
--import Text.PrettyPrint
import qualified Data.ByteString.UTF8 as U
import qualified Blaze.ByteString.Builder as BB

--minify :: U.ByteString -> String
--minify s = show $ renderJS $ readJs s
minify :: U.ByteString -> Data.ByteString.Lazy.Internal.ByteString
minify s = BB.toLazyByteString $ renderJS $ readJs s

--_minify' :: U.ByteString -> Doc
_minify' :: U.ByteString -> BB.Builder
_minify' s = renderJS $ readJs s

-- TODO: read file as a ByteString
--minifyFile :: FilePath -> IO String
minifyFile
  :: FilePath -> IO Data.ByteString.Lazy.Internal.ByteString
minifyFile filename =
  do 
     x <- readFile (filename)
     return $ minify (U.fromString x)
    
-- EOF    
