-- Project Euler
-- https://projecteuler.net/
-- """
-- Problem 80
-- It is well known that if the square root of a natural number is not an integer, 
-- then it is irrational. The decimal expansion of such square roots is infinite 
-- without any repeating pattern at all.

-- The square root of two is 1.41421356237309504880..., and the digital sum 
-- of the first one hundred decimal digits is 475.

-- For the first one hundred natural numbers, find the total of the digital 
-- sums of the first one hundred decimal digits for all the irrational square roots.
-- **************************************************************************************
-- Python Solution to "prime the pump":
-- """
-- from decimal import * #Compute big square roots 
-- import math
-- # Check for irrational roots
-- def is_irrational(num):
--     int_sqrt = int(math.sqrt(num))
--     if int_sqrt**2 != num:
--         return True
--     else:
--         return False

-- getcontext().prec = 102 #added precision to avoid round off

-- #Used to generate a list roots square
-- def print_dec_sqrts():
--     for i in range (1,101):
--         if(is_irrational(i)):
 --            print(Decimal(i).sqrt())
            
-- #Digit sum function         
-- def digit_sum(num):
--     sum = 0
--     num_str = str(num)
--     for item in num_str:
--         sum+=int(item)
--     return sum

-- #read the above from a text file
-- with open('p_080.txt') as f:
--     content = f.readlines()
-- # you may also want to remove whitespace characters like `\n` at the end of each line
-- content = [x.strip() for x in content] 

-- sum = 0
-- for item in content:
--     item = item[0:100]#extract first 100 digits
--     sum+=digit_sum(item)
-- print(sum) #print sum

-- '''
-- Congratulations, the answer you gave to problem 80 is correct.

-- You are the 18747th person to have solved this problem.

-- This problem had a difficulty rating of 20%. 
-- The highest difficulty rating you had previously solved was 5%. 
-- This is a new record. Well done!
-- '''
-- **************************************************************************************
-- Haskell Solution
-- Here we use the p_080.txt text file generated by the Python program above
-- This consists of the irrational square roots to 102 decimal places
-- 102 decimal places insures there will be no round off error
-- The firstline of p_080.txt is then:
-- 141421356237309504880168872420969807856967187537694807317667973799073247846210703885038753432764157274
-- The solution below is adhoc and avoids the IO monad

-- crazy long list of 102 digit square roots
num_lst = [141421356237309504880168872420969807856967187537694807317667973799073247846210703885038753432764157274,173205080756887729352744634150587236694280525381038062805580697945193301690880003708114618675724857568,223606797749978969640917366873127623544061835961152572427089724541052092563780489941441440837878227497,244948974278317809819728407470589139196594748065667012843269256725096037745731502653985943310464023482,264575131106459059050161575363926042571025918308245018036833445920106882323028362776039288647454361062,282842712474619009760337744841939615713934375075389614635335947598146495692421407770077506865528314547,316227766016837933199889354443271853371955513932521682685750485279259443863923822134424810837930029519,331662479035539984911493273667068668392708854558935359705868214611648464260904384670884339912829065091,346410161513775458705489268301174473388561050762076125611161395890386603381760007416229237351449715135,360555127546398929311922126747049594625129657384524621271045305622716694829301044520461908201849071767,374165738677394138558374873231654930175601980777872694630374546732003515630693902797680989519437957150,387298334620741688517926539978239961083292170529159082658757376611348309193697903351928737685867351792,412310562561766054982140985597407702514719922537362043439863357309495434633762159358786365081068429668,424264068711928514640506617262909423570901562613084421953003921397219743538632111655116260298292471821,435889894354067355223698198385961565913700392523244493689034413815955732820315808565615915585194452691,447213595499957939281834733746255247088123671922305144854179449082104185127560979882882881675756454994,458257569495584000658804719372800848898445657676797190260724212390686842554777088660436155949344503268,469041575982342955456563011354446628058822835341173715360570189101702463275323972148211559606154313535,479583152331271954159743806416269391999670704190412934648530911444825723590746408249219144643691886062,489897948556635619639456814941178278393189496131334025686538513450192075491463005307971886620928046964,509901951359278483002822410902278198956377094609959640758497080442593363206222419558834885109393200836,519615242270663188058233902451761710082841576143114188416742093835579905072640011124343856027174572703,529150262212918118100323150727852085142051836616490036073666891840213764646056725552078577294908722123,538516480713450403125071049154032955629512016164478883768038867001664596282765869287663378167983548442,547722557505166113456969782800802133952744694997983254226894449732493277122722733800858436163870625765,556776436283002192211947129891854952047639337757041430396843258560358983925423629292721839618492667842,565685424949238019520675489683879231427868750150779229270671895196292991384842815540155013731056629094,574456264653802865985061146821892931822026445798279236769987747056590072145740462702712536559678812242,583095189484530047087415287754558307652139833488597195445000674486781006199671262766524032645303539856,591607978309961604256732829156161704841550123079434032287971966914282245910565303676575252718310917809,608276253029821968899968424520206706208497009478641118641915304648633272531891023980306642795784866343,616441400296897645025019238145424422523562402344457454487457207245839965026366421296672979919889994515,624499799839839820584689312093979446107295997799165630845297193060961120058351450063333611222134058711,632455532033675866399778708886543706743911027865043365371500970558518887727847644268849621675860059037,640312423743284868648821767462181326452042013262101888552927262666818275819687607428935430224986996317,648074069840786023096596743608799665770520430705834654971135439780961737784404437140036090660561023568,655743852430200065234410999763600162792696631988378976986546010558565985348857563935580529096967854802,663324958071079969822986547334137336785417709117870719411736429223296928521808769341768679825658130181,670820393249936908922752100619382870632185507883457717281269173623156277691341469824324322513634682491,678232998312526813906455632662596910519574832392328823275021958208072826398711258986264094093633004423,685565460040104412493587144908484896046064346100132627548510818567851711513681699922732514850006683694,692820323027550917410978536602348946777122101524152251222322791780773206763520014832458474702899430270,707106781186547524400844362104849039284835937688474036588339868995366239231053519425193767163820786368,714142842854284999799939981136726527876617115990273383320843088276582040644002188625898821353282041823,721110255092797858623844253494099189250259314769049242542090611245433389658602089040923816403698143535,728010988928051827109730249152703279377766968257647743837818179128411573862490518332957940908092675219,734846922834953429459185222411767417589784244197001038529807770175288113237194507961957829931392070446,741619848709566294871139744080071306097990431909750159873262326434383018431385024275300921319582494351,748331477354788277116749746463309860351203961555745389260749093464007031261387805595361979038875914300,754983443527074969723668480694611705822219470462338013829862690571072195391781119558245207414752397258,761577310586390828566141102715832300536070559254659846895048424052035215737300124464226971438715164562,768114574786860817576968702173137247306245107761488392802473648393554165799270985185604772796137779902,774596669241483377035853079956479922166584341058318165317514753222696618387395806703857475371734703583,781024967590665439412972273575910141356830513664856330017724376019078558893672705442543305226700489518,787400787401181101968503444881200786368108612202085379459884255031376084681769805692619135124874688993,793725393319377177150484726091778127713077754924735054110500337760320646969085088328117865942363083185,806225774829854965236661323030377113113439630560857338793659238926387495102568820296015426671723064364,812403840463596036045988356826604034850420408672531282765157559453291680284067269499915760294793687744,818535277187244996995370372473392945888048681549803996306671520272366761446109794534392467163786834453,824621125123532109964281971194815405029439845074724086879726714618990869267524318717572730162136859337,830662386291807485258426274490749201023221424895565577943218836903758503342315157386739850823235705027,836660026534075547978172025785187489392815369298672199811191543080418772594317009830814711964951536165,842614977317635863063413990620273603160800240156075001366781112932722550275520305548569353729896965907,848528137423857029281013234525818847141803125226168843906007842794439487077264223310232520596584943641,854400374531753116787164832623970643459445532953328224190865125377164881932729838108097203010700942960,860232526704262677172947353504971363202753555729073561950804564123742693466301701278333089069896206440,866025403784438646763723170752936183471402626905190314027903489725966508454400018540573093378624287838,871779788708134710447396396771923131827400785046488987378068827631911465640631617131231831170388905381,877496438739212206040638830741630956087587682755450359092769562978276464621930628167569315706870575594,883176086632784685476404272695925396417463948093141782621020297255713993823544284037043553941477151773,888819441731558885009144167540872781707645060372952629835472011637610059962859959602359295271363055316,894427190999915878563669467492510494176247343844610289708358898164208370255121959765765763351512909988,905538513813741662657380816698406641305212446409694027658174123001865798076605923338496067859099092645,911043357914429888194562610468866919009913916826495585249693846506602119428340566558534146092917724674,916515138991168001317609438745601697796891315353594380521448424781373685109554177320872311898689006536,921954445729288731000227428176279315724680504872246400800775220544267102680187546076789409079328056494,927361849549570375251641607399017462626346891207629821337382659832823683646384302323204585735847438425,932737905308881504555447554232055698327624069419165467105619729844678454880724967841422056291188201600,938083151964685910913126022708893256117645670682347430721140378203404926550647944296423119212308627071,943398113205660381132066037762264071698362263341512132066298144898002290958511805854102698689038410454,948683298050513799599668063329815560115866541797565048057251455837778331591771466403274432513790088556,953939201416945649152621586023226540254623425250545753908151852910362552305650721827782176449122069822,959166304662543908319487612832538783999341408380825869297061822889651447181492816498438289287383772123,964365076099295499576003104743266318390690369306325240730017688773128641866864972290005470929360859108,969535971483265802814888115084531339365215098795467959053971748623303986757330072848325867847691749658,974679434480896390683841319989960029925258390033749103199175000572008177246024935684871209603806552756,979795897113271239278913629882356556786378992262668051373077026900384150982926010615943773241856093927,984885780179610472174621141491762448169613628744276417172315452983644058370767863009320078411542576244,989949493661166534161182106946788654998770312763863651223675816593512734923474927195271274029349100915,994987437106619954734479821001206005178126563676806079117604643834945392782713154012653019738487195272]

-- convert_list "3456789" -> [3,4,5,6,7,8,9]
convert_list :: String -> [Int]
convert_list = map (read . return) . concat . lines

-- Curried take first 100 items of a list function
take_100 :: [a] -> [a]
take_100 = take 100

-- Create string version of num_lst
-- [123,456] -> ["123", "456"]
num_lst_string :: [String]
num_lst_string = map show num_lst

-- Expand each string into a digit list 
-- ["123", "456"] -> [[1,2,3],[4,5,6]]
list_of_digit_list :: [[Int]]
list_of_digit_list = map convert_list num_lst_string 

-- Reduce list_of_digit_list by dropping last two items 
fist_100_list :: [[Int]]
fist_100_list = map take_100 list_of_digit_list

-- [475,441,473,471,398,465,459,484,406,418,485,500,450,401,472,488,484,407,453,
-- 484,455,398,401,459,467,473,471,472,459,440,457,462,465,486,451,445,503,483,440,
-- 451,423,398,470,468,432,477,461,432,467,453,409,499,479,436,450,439,440,464,498,
-- 451,438,464,417,424,427,427,435,459,484,456,461,500,455,474,456,426,459,459,409,
-- 408,477,412,502,452,502,459,483,440,477,446]
list_of_digit_sums :: [Int]
list_of_digit_sums = map sum fist_100_list 


answer :: Int
answer = sum list_of_digit_sums

-- Display answer
-- 40886
-- (0.03 secs, 36,719,992 bytes)
main :: IO ()
main = do  
    putStrLn$show answer




