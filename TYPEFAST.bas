CONST masir$ = "c:\massih\quick\"
11 DATA a,b,c,d,e,f,g,h,i,j
12 DATA k,l,m,n,o,p,q,r,s,t
13 DATA u,v,w,x,y,z,0,1,2,3
14 DATA 4,5,6,7,8,9,%,?,*,\
15 DATA /,|,":",.,",",+,;,<,>,$
21 DATA ac,ad,am,an,as,at,be,by,cd,co
22 DATA dc,dd,di,do,ds,er,ex,fa,fm,go
23 DATA hd,he,hi,if,im,in,ir,is,it,la
24 DATA md,me,mi,no,of,oh,ok,on,or,rd
25 DATA re,so,ti,to,tv,un,up,us,we,xt
31 DATA and,are,ask,aux,bat,cls,com,con,del,dir
32 DATA dis,dos,ega,est,exe,fat,fog,for,fun,hot
33 DATA ibm,lid,lpt,nul,map,may,mem,obj,odd,one
34 DATA ovl,prn,ram,rem,ren,rom,set,she,six,sol
35 DATA sub,sys,ten,the,tri,two,ver,vga,vol,yes
41 DATA boot,call,copy,date,deca,deep,disk,echo,edit,even
42 DATA exit,file,find,five,four,goto,help,hexa,icon,item
43 DATA july,june,list,load,menu,make,mode,mono,more,move
44 DATA name,nine,nona,octa,only,path,plus,port,quit,read
45 DATA scan,size,sort,star,time,tree,type,wide,zero,zone
51 DATA april,ascii,basic,bebop,begin,break,breif,chdir,clean,clear
52 DATA clock,comet,debug,drdos,drive,eight,empty,enter,erase,error
53 DATA exist,extra,facet,fdisk,field,label,laser,march,mkdir,mouse
54 DATA msdos,order,pause,pcdos,penta,print,razor,rmdir,septa,setup
55 DATA seven,sharp,shell,shift,super,tetra,three,track,write,xcopy
61 DATA access,attrib,append,august,backup,buffer,cancel,chkdsk,choice,config
62 DATA defrag,delete,device,doskey,employ,expand,filter,floppy,format,friday
63 DATA guitar,hidden,ignore,memory,monday,murder,option,permit,phrase,prompt
64 DATA pseudo,random,record,remark,remove,rename,screen,secret,sector,source
65 DATA status,sunday,switch,syntax,system,target,unload,verify,volume,window
71 DATA airport,archive,article,biology,century,comfort,command,console,country,default
72 DATA deltree,density,develop,display,episode,execute,exhibit,express,geology,hundred
73 DATA iceberg,include,inquire,install,january,journey,lettuce,mention,monitor,october
74 DATA operate,physics,pioneer,plotter,process,protect,printer,purpose,rapport,replace
75 DATA restore,satisfy,scanner,scholar,science,segment,swindle,tuesday,vanilla,version
81 DATA acoustic,autoexec,auxilary,ceremony,continue,contrast,dblspace,december,dinosaur,diskcomp
82 DATA diskcopy,diskette,dosshell,fasthelp,fastopen,february,filename,function,genetics,geometry
83 DATA harddisk,hologram,hospital,ideology,identify,industry,interlnk,keyboard,language,magazine
84 DATA msbackup,mushroom,november,obstacle,parallel,possible,question,reaction,readonly,saturday
85 DATA security,shoulder,smartdrv,spectrum,surround,thousand,thursday,undelete,unformat,wildcard
91 DATA ascertain,associate,assurance,attention,attribute,authentic,badminton,barcarole,batchfile
92 DATA befurcate,catalogue,chemistry,configure,dangerous,deciduous,denigrate,dependent,digestion,directory
93 DATA evergreen,excellent,extension,germinate,grassland,halitosis,highlight,hourglass,imitation,labyrinth
94 DATA lastdrive,microsoft,migration,newspaper,observant,parameter,percolate,phonetics,procedure,projector,quotation
95 DATA segregate,selection,september,signature,situation,stevedore,submarine,unskilled,volunteer,wednesday
OPTION BASE 1: RANDOMIZE TIMER
DIM wr$(9, 50), b(9), per(9), name$(9), rec$(9), rec(9)
FOR i = 1 TO 9: FOR j = 1 TO 50: READ wr$(i, j): NEXT: NEXT
OPEN masir$ + "reflex.dat" FOR INPUT AS #1
FOR i = 1 TO 9
INPUT #1, rec$(i), name$(i)
rec(i) = VAL(rec$(i))
PRINT rec(i), name$(i)
NEXT
CLOSE #1
COLOR , 1: CLS
first = 1
DO
COLOR , 1: CLS
COLOR 15, 4: LOCATE 1, 24: PRINT " Typewriting Speed Quiz "
COLOR 14, 1: LOCATE 7, 2: PRINT "Letter": LOCATE 7, 15: PRINT "Time": LOCATE 7, 25: PRINT "Time per Button": LOCATE 7, 47: PRINT "best T/B": LOCATE 7, 65: PRINT "Signature"
LOCATE 6, 1: PRINT STRING$(75, 205): LOCATE 8, 1: PRINT STRING$(75, 196): LOCATE 18, 1: PRINT STRING$(75, 205)
FOR i = 1 TO 9
COLOR 14: LOCATE 8 + i, 3: PRINT i: COLOR 3: LOCATE 8 + i, 14: PRINT USING "##.##"; b(i): LOCATE 8 + i, 29: PRINT USING "#.###"; per(i): LOCATE 8 + i, 48: PRINT USING "#.###"; rec(i): LOCATE 8 + i, 65: PRINT name$(i)
NEXT
IF first = 1 THEN
COLOR 7: LOCATE 3, 1: PRINT "Type your SIGNATURE up to 10 characters, then press [Enter]."
COLOR 15: LOCATE 4, 1: INPUT "", sign$
sign$ = LEFT$(sign$, 10)
LOCATE 3, 1: PRINT SPACE$(61): first = 2
END IF
COLOR 7: LOCATE 3, 1: PRINT "Select a skill level number (1-9); or press [Esc] to quit."
LOCATE 4, 1: PRINT "NOTE: The chronometer will start 3 SECONDS after your selection."
k$ = INPUT$(1)
SELECT CASE ASC(k$)
CASE 27
EXIT DO
CASE 49 TO 57
lv = VAL(k$)
word$ = wr$(lv, INT(RND * 50 + 1))
COLOR 11:  LOCATE 8 + lv, 14: PRINT USING "##.##"; b(lv): LOCATE 8 + lv, 29: PRINT USING "#.###"; per(lv): LOCATE 8 + lv, 48: PRINT USING "#.###"; rec(lv): LOCATE 8 + lv, 65: PRINT name$(lv)
LOCATE 3, 1: PRINT SPACE$(60): LOCATE 4, 1: PRINT SPACE$(64)
COLOR 11: LOCATE 5, 1: PRINT " "; sign$; " ": LOCATE 3, 1: COLOR 23: PRINT " Type:"
SLEEP 3: SOUND 600, 1
LOCATE 3, 1: COLOR 7, 1: PRINT " Type:"; : LOCATE 3, 12: COLOR 15, 0: PRINT " "; UCASE$(word$); " ": a = TIMER
LOCATE 3, 62: COLOR 7, 1: PRINT "Time:": LOCATE 5, 51: PRINT "Time per Button:": LOCATE 4, 60: PRINT "Faults:"
faul = 0: i = 1: DO
DO
LOCATE 3, 68: COLOR 3: PRINT USING "#.#"; TIMER - a: LOCATE 4, 67: PRINT faul
k$ = LCASE$(INKEY$)
IF k$ <> "" AND k$ <> MID$(word$, i, 1) THEN SOUND 400, 1: faul = faul + 1
LOOP WHILE k$ <> MID$(word$, i, 1)
i$ = i$ + k$: i = i + 1
LOCATE 3, 13: COLOR 12, 0: PRINT UCASE$(i$)
LOOP UNTIL i$ = word$ OR TIMER - a > 10
b(lv) = TIMER - a: i$ = ""
FOR i = faul TO 0 STEP -1
SLEEP 1
COLOR 3, 1: LOCATE 3, 68: PRINT USING "#.##"; b(lv): LOCATE 4, 67: PRINT i
IF i > 0 THEN b(lv) = b(lv) + .1
SOUND 400, 1
NEXT
per(lv) = b(lv) / lv: LOCATE 5, 68: PRINT USING "#.###"; per(lv)
IF b(lv) < 10 THEN
COLOR 11:  LOCATE 8 + lv, 14: PRINT USING "##.##"; b(lv): LOCATE 8 + lv, 29: PRINT USING "#.###"; per(lv): LOCATE 8 + lv, 48: PRINT USING "#.###"; rec(lv): LOCATE 8 + lv, 65: PRINT name$(lv)
END IF
IF per(lv) < rec(lv) THEN
record = rec(lv) - per(lv)
PLAY "t255o3l5co5l5co4l5c"
COLOR 27: LOCATE 8 + lv, 29: PRINT USING "#.###"; per(lv)
COLOR 12, 1: LOCATE 19, 27: PRINT "Congradulations, "; sign$; " !"
LOCATE 20, 10: COLOR 12: PRINT "You had ";
PRINT USING "#.###"; record;
PRINT "s better time record than "; name$(lv); " in level"; lv
rec(lv) = per(lv): name$(lv) = sign$
k$ = INPUT$(1)
LOCATE 19, 27: PRINT SPACE$(30)
LOCATE 20, 1: PRINT SPACE$(60)
END IF
CASE ELSE
BEEP
END SELECT
LOOP
OPEN masir$ + "reflex.dat" FOR OUTPUT AS #1
CLS
FOR i = 1 TO 9
PRINT #1, STR$(rec(i))
PRINT #1, name$(i)
NEXT
SYSTEM

