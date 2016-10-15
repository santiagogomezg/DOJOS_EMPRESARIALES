x:: Int
x=5

lucky ::(Integral a) => a -> String
lucky 7 = "Enchimbado"
lucky x= "Muy demalas gonorrea ome gonorrea"

factorial :: Integer -> Integer
factorial 0 = 1
factorial x = x * factorial (x-1)

sumatoria :: Integer -> Integer
sumatoria 0 = 0
sumatoria x = x + sumatoria (x-1)

sumEveryTwo :: [Integer] -> [Integer]
sumEveryTwo []=[]
sumEveryTwo (x:[]) = [x]
sumEveryTwo (x:y:zs) = (x+y): sumEveryTwo zs

intListLength :: [Int] -> Int
intListLength [] = 0
intListLength (x:[]) = 1
intListLength (x:za) = 1 + intListLength(za)

pesoTest :: Int -> [Char]
pesoTest peso
	|peso<=40 = "Flaco"
	|peso<=60 = "En la linea"
	|peso<=80 = "Gordo"
	|otherwise = "Marrano"

mayor :: Int -> Int -> Int
mayor a b
	| a>b = a
	|otherwise = b

duplicarPares xs=[x*2| x<-xs, (mod x 2)==0]

multiplosDeTres xs=[x| x<-xs, (mod x 3)==0]