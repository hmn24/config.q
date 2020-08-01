# config.q

Emulating python's configparser library

```
q).config.loadConfig `:config.ini
1b

q)A
20

q)B
10

q).CONFIG1
 | ::
A| 20
B| 2

q).CONFIG2
         | ::
CONFIG2_A| ``CONFIG2_AA!(::;``A`B`C!(::;`asdfasd;"asdf";("asfd";`sasdf)))
CONFIG2_B| ``A`B`C!(::;1;+(,`a)!,0 1 2 3 4 5 6 7 8 9;3)

q).CONFIG2.CONFIG2_A.CONFIG2_AA
 | ::
A| `asdfasd
B| "asdf"
C| ("asfd";`sasdf)

q).CONFIG2.CONFIG2_B
 | ::
A| 1
B| +(,`a)!,0 1 2 3 4 5 6 7 8 9
C| 3

q).CONFIG3
 | ::
E| 20
F| 2
```