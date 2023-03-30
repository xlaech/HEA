module Main (main) where

import System.Console.HCL
import Lib

main :: IO ()
main = execReq $ reqConfirm confirm $ reqForever topMenu
    where
        confirm = promptAgree "Are you sure you want to quit? " (Just False) reqResp

someRes :: Request ()
someRes = reqIO someFunc

topMenu :: Request ()
topMenu = reqMenu $
    reqMenuItem "fun" (reqIO someFunc) $
    reqMenuItem "test" notImpl $
    reqMenuEnd

notImpl :: Request ()
notImpl = reqIO $ putStrLn "This function is not implemented."