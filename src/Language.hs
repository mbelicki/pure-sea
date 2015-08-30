module Language where

data ModuleDecl = Module String deriving Show
data ImportDirective = Import String deriving Show

data Comment = LineComment String | BlockComment String deriving Show

data FunctionModifier = InterfaceFunc | PrivateFunc | Pure deriving Show

data Argument = Argument { argTypeName :: String
                         , argName :: String
                         } deriving Show

data Function = Function { funcModifiers :: [FunctionModifier]
                         , funcBoundType :: String
                         , funcName :: String
                         , funcArgs :: [Argument]
                         , funcBody :: String
                         } deriving Show

data TypeDefModifiers = InterfaceType | PrivateType | Tagged deriving Show

data StructField = StructField { structFieldType :: String
                               , structFieldName :: String
                               } deriving Show

data TypeDefinition = StructDefinition { structModifiers :: [TypeDefModifiers]
                                       , structName :: String
                                       , structFields ::[StructField]
                                       } deriving Show

