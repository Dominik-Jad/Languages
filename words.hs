import Data.Char
import Data.List
import Data.Function

commonWords = ["the", "be", "to", "of", "and", "a", "in", "that", "have", "I", "it", "for", "not", "on", "with", "he", "as", "you", "do", "at"]

toWordList :: String -> [String]
toWordList str = (words (filter (/= ',' ) (map toLower str)))

countCommonWords :: [String] -> Int
countCommonWords str = sum (map(\x -> (length x)) $ group $ sort (filter (\x -> x `elem` commonWords) str))

dropCommonWords :: [String] -> [String]
dropCommonWords str = filter (\x -> x `notElem` commonWords) str

countWords :: [String] -> [(String,Int)]
countWords str = map (\x -> (head x, length x)) $ group $ sort str

sortWords :: [(String, Int)] -> [(String, Int)]
sortWords = reverse.sortBy(compare `on` snd)

toAsteriskBar x = (replicate (snd x) '*') ++ " -> " ++ (fst x) ++ "\n"

makeHistogram :: [(String, Int)] -> String
makeHistogram str = concat $ map toAsteriskBar (take 20 str)

text = "It was the best of times, it was the worst of times, it was the age of wisdom, it was the age of foolishness, it was the epoch of belief, it was the epoch of incredulity, it was the season of Light, it was the season of Darkness, it was the spring of hope, it was the winter of despair, we had everything before us, we had nothing before us, we were all going direct to Heaven, we were all going direct the other way--in short, the period was so far like the present period, that some of its noisiest authorities insisted on its being received, for good or for evil, in the superlative degree of comparison only.\nThere were a king with a large jaw and a queen with a plain face, on the throne of England; there were a king with a large jaw and a queen with a fair face, on the throne of France. In both countries it was clearer than crystal to the lords of the State preserves of loaves and fishes, that things in general were settled for ever."
main = do
  let wordlist = toWordList text
  putStrLn "Report:"
  putStrLn ("\t" ++ (show $ length wordlist) ++ " words")
  putStrLn ("\t" ++ (show $ countCommonWords wordlist) ++ " common words")
  putStrLn "\nHistogram of the most frequent words (excluding common words):\n"
  putStr $ makeHistogram $ sortWords $ countWords $ dropCommonWords $ wordlist
