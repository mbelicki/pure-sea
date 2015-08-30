module Parser where

import Text.Parsec as P
import Data.List

import Language

parseModuleDecl :: Parsec String () ModuleDecl
parseModuleDecl
    = do
        string "module"
        spaces
        name <- many1 letter
        spaces
        char ';'
        return $ Module name


parseImportDirective :: Parsec String () ImportDirective
parseImportDirective
    = do
        string "import"
        spaces
        name <- many1 letter
        spaces
        char ';'
        return $ Import name

word :: Parsec String () String
word
    = do 
        lead <- leadChar
        rest <- many wordChar
        spaces
        return $ lead : rest
        where
            leadChar = letter <|> char '_'
            wordChar = leadChar <|> digit

-- TODO: real type parsing
parseArgument :: Parsec String () Argument
parseArgument
    = do
        spaces
        words <- many1 word
        P.optional $ char ','
        let typeString = concat $ intersperse " " $ init words
        let nameString = last words
        return $ Argument typeString nameString

parseArgumentList :: Parsec String () [Argument]
parseArgumentList
    = do
        char '('
        arguments <- many parseArgument
        char ')'
        return arguments

parseBody :: Parsec String () String
parseBody
    = do
        char '{'
        body <- many $ noneOf "}"
        char '}'
        return body

--parseDelcaration :: Parsec String () (Either Function TypeDefinition)
--parseDelcaration
--    = do
--        words <- many1 word
--        argumentList <- optionMaybe $ parseArgumentList
--        spaces
--        body <- parseBody
--        return $ 




