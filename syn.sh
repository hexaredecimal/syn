 word="" # the scanned word 
is_str=false

IFS=$'\n'

# brief : highlights the data type (default)
data_type_color()
{
	printf "\e[34m$1\e[0m"
	word=""
}

# brief : for handling unwanted characters passed with the word , on the left side 
data_type_color_cl()
{
	printf "$1\e[34m$2\e[0m"
	word=""
}

# brief : for handling unwanted characters passed with the word , on the right side 
data_type_color_cr()
{
	printf "\e[34m$2\e[0m$1"
	word=""
}



# brief : for handling unwanted characters passed with the word , on both sides 
data_type_color_bs()
{
	printf "$1\e[34m$2\e[0m$3"
	word=""
}


# brief : for handling keywords 
keyword_color()
{
	printf "\e[1;35m$1\e[0m"
	word=""
}

keyword_color_cl()
{
	printf "$1\e[1;35m$2\e[0m"
	word=""
}

keyword_color_cr()
{
	printf "\e[1;35m$1\e[0m$2"
	word=""
}

keyword_color_bs()
{
	printf "$1\e[1;35m$2\e[0m$3"
	word=""
}

printval()
{
	printf "\e[1;30m$1\e[0m"
	word=""
}

printsym()
{
  printf "$1" 
  word=""
}

print_preproc()
{
  printf "\e[1;33m$1\e[0m"
  word=""
}

print_preproc_l()
{
  printf "$1\e[1;33m$2\e[0m"
  word=""
}

print_preproc_r()
{
  printf "\e[1;33m$1\e[0m%2"
  word=""
}

print_preproc_bs()
{
  printf "$1\e[1;33m$2\e[0m"
  word=""
}

print_err()
{
  printf "\e[41;30m$1\e[0m"
  word=""
}


show_tab()
{
	printf '\t' 
}

_color()
{
	
	           case "$word" in
	         
	         
	         ## ______________ preproc words __________
	          ${SYN_HASH_TAG:="#"}) print_preproc "#" ;;
	          ${SYN_HASH_TAG_NL:="\n#"}) print_preproc_l "\n" "#" ;;
	          ${SYN_HASH_TAG_TB:="\t#"}) print_preproce_l "\t" "#" ;;
	          ${SYN_INC:=include}) print_preproc "$word" ;;
	          ${SYN_IFDEF:=ifdef}) print_preproc "$word" ;;
	          ${SYN_ELSEIF:=elseif}) print_preproc "$word" ;;
	          ${SYN_ENDIF:=endif}) print_preproc "$word" ;;
	          ${SYN_DEF:=define}) print_preproc "$word" ;;
	         
	         ## ______________ int datatype ____________
	          ${SYN_ID:=int}) data_type_color int ;;
	          ${SYN_IC1:=,int}) data_type_color_cl , int  ;;
	          ${SYN_IC4:="\nint"}) data_type_color_cl "\n" int;;
	          ${SYN_IC5:="\tint"}) data_type_color_cl "\t" int;;
	          ${SYN_IC7:="\n\tint"}) data_type_color_cl "\n\t" int;;	 
	          ${SYN_IC8:="\nint*"}) data_type_color_bs "\n" int "*" ;; 
	          ${SYN_IC9:="\tint*"}) data_type_color_bs "\t" int "*" ;; 
	          ${SYN_IC10:="\n\tint*"}) data_type_color_bs "\n\t" int "*" ;; 
	          ${SYN_IC11:=",int*"}) data_type_color_bs "," int "*" ;; 
	          ${SYN_IC14:="(int)"}) data_type_color_bs "(" int ")" ;;
	          ${SYN_IC14:="(int*)"}) data_type_color_bs "(" int "*)" ;;
	          ${SYN_IC12:="int*)"}) data_type_color_cr int "* )" ;; 
	          ${SYN_IC13:="(int*"}) data_type_color_bs "(" int "*" ;; 
	          ${SYN_IC2:=(int}) data_type_color_cl "(" int ;;
	          ${SYN_IC3:=int)}) data_type_color_cr ")" int ;;
	             
	         ## ______________ float datatype ______________     
	          ${SYN_FD:=float}) data_type_color float ;;
	          ${SYN_FC1:=,float}) data_type_color_cl , float;;
	          ${SYN_FC4:="\nfloat"}) data_type_color_cl "\n" float ;;
	          ${SYN_FC5:="\tfloat"}) data_type_color_cl "\t" float ;;
	          ${SYN_FC7:=",float"}) data_type_color_cl "\n\t" float;;	 	
	          ${SYN_FC8:="\nfloat*"}) data_type_color_bs "\n" float "*" ;; 
	          ${SYN_FC9:="\tfloat*"}) data_type_color_bs "\t" float "*" ;; 
	          ${SYN_FC10:="\n\tfloat*"}) data_type_color_bs "\n\t" float "*" ;; 
	          ${SYN_FC11:=",float*"}) data_type_color_bs "," float "*" ;; 
	          ${SYN_FC14:="(float)"}) data_type_color_bs "(" float ")" ;;
	          ${SYN_FC14:="(float*)"}) data_type_color_bs "(" float "*)" ;;
	          ${SYN_FC12:="float*)"}) data_type_color_cr float "* )" ;; 
	          ${SYN_FC13:="(float*"}) data_type_color_bs "(" float "*" ;; 
	          ${SYN_FC2:=(float}) data_type_color_cl "(" float;;
	          ${SYN_FC3:=float)}) data_type_color_cr ")" float ;;
	

	         ## ______________ short datatype ______________     
	          ${SYN_SD:=short}) data_type_color short ;;
	          ${SYN_SC1:=,short}) data_type_color_cl , short ;;
	          ${SYN_SC2:=(short}) data_type_color_cl "(" short;;
	          ${SYN_SC3:=short)}) data_type_color_cr ")" short ;;
	          ${SYN_SC4:="\nshort"}) data_type_color_cl "\n" short ;;
	          ${SYN_SC5:="\tshort"}) data_type_color_cl "\t" short ;;
	          ${SYN_SC7:=",short"}) data_type_color_cl "\n\t" short;;	 	
	          ${SYN_SC8:="\nshort*"}) data_type_color_bs "\n" short "*" ;; 
	          ${SYN_SC9:="\tshort*"}) data_type_color_bs "\t" short "*" ;; 
	          ${SYN_SC10:="\n\tshort*"}) data_type_color_bs "\n\t" short "*" ;; 
	          ${SYN_SC11:=",short*"}) data_type_color_bs "," short "*" ;; 
	          ${SYN_SC14:="(short)"}) data_type_color_bs "(" short ")" ;;
	          ${SYN_SC14:="(short*)"}) data_type_color_bs "(" short "*)" ;;
	          ${SYN_SC12:="short*)"}) data_type_color_cr short "* )" ;; 
	          ${SYN_SC13:="(short*"}) data_type_color_bs "(" short"*" ;; 
	       	         

	         ## ______________ long datatype ______________     
	          ${SYN_LD:=long}) data_type_color long ;;
	          ${SYN_LC1:=,long}) data_type_color_cl , long;;
	          ${SYN_LC2:=(long}) data_type_color_cl "(" long ;;
	          ${SYN_LC3:=long)}) data_type_color_cr ")" long  ;;
	          ${SYN_LC4:="\nlong"}) data_type_color_cl "\n" long  ;;
	          ${SYN_LC5:="\tlong"}) data_type_color_cl "\t" long  ;;
	          ${SYN_LC7:=",long"}) data_type_color_cl "\n\t" long ;;	 	
	          ${SYN_LC8:="\nlong*"}) data_type_color_bs "\n" long  "*" ;; 
	          ${SYN_LC9:="\tlong*"}) data_type_color_bs "\t" long "*" ;; 
	          ${SYN_LC10:="\n\tlong*"}) data_type_color_bs "\n\t" long "*" ;; 
	          ${SYN_LC11:=",long*"}) data_type_color_bs "," long "*" ;; 
	          ${SYN_LC14:="(long)"}) data_type_color_bs "(" long ")" ;;
	          ${SYN_LC14:="(long*)"}) data_type_color_bs "(" long "*)" ;;
	    
	          ${SYN_LC12:="long*)"}) data_type_color_cr long  "* )" ;; 
	          ${SYN_LC13:="(long*"}) data_type_color_bs "(" long "*" ;; 
	       	         
	          
	         ## ______________ double datatype ______________     
	          ${SYN_DD:=double}) data_type_color double ;;
	          ${SYN_DC1:=,double}) data_type_color_cl , double  ;;
	          ${SYN_DC2:=(double}) data_type_color_cl "(" double  ;;
	          ${SYN_DC3:=double)}) data_type_color_cr ")" double ;;
	          ${SYN_DC4:="\ndouble"}) data_type_color_cl "\n" double ;;
	          ${SYN_DC5:="\tdouble"}) data_type_color_cl "\t" double ;;
	          ${SYN_DC7:=",double"}) data_type_color_cl "\n\t" double  ;;	 	
	          ${SYN_DC8:="\ndouble*"}) data_type_color_bs "\n" double "*" ;; 
	          ${SYN_DC9:="\tdouble*"}) data_type_color_bs "\t" double "*" ;; 
	          ${SYN_DC10:="\n\tdouble*"}) data_type_color_bs "\n\t" double "*" ;; 
	          ${SYN_DC11:=",double*"}) data_type_color_bs "," double "*" ;; 
	          ${SYN_DC14:="(double)"}) data_type_color_bs "(" double ")" ;;
	          ${SYN_DC14:="(double*)"}) data_type_color_bs "(" double "*)" ;;
	          ${SYN_DC12:="double*)"}) data_type_color_cr double "* )" ;; 
	          ${SYN_DC13:="(double*"}) data_type_color_bs "(" double "*" ;; 
	          
	          
	          
	         ## ______________ char datatype ______________     
	          ${SYN_CD:=char}) data_type_color char ;;
	          ${SYN_CC1:=,char}) data_type_color_cl , char ;;
	          ${SYN_CC2:=(char}) data_type_color_cl "(" char ;;
	          ${SYN_CC3:=char)}) data_type_color_cr ")" char ;;
	          ${SYN_CC4:="\nchar"}) data_type_color_cl "\n" char ;;
	          ${SYN_CC5:="\tchar"}) data_type_color_cl "\t" char ;;
	          ${SYN_CC7:=",char"}) data_type_color_cl "\n\t" char ;;	 	
	          ${SYN_CC8:="\nchar*"}) data_type_color_bs "\n" char "*" ;; 
	          ${SYN_CC9:="\tchar*"}) data_type_color_bs "\t" char "*" ;; 
	          ${SYN_CC10:="\n\tchar*"}) data_type_color_bs "\n\t" char "*" ;; 
	          ${SYN_CC11:=",char*"}) data_type_color_bs "," char "*" ;; 
	          ${SYN_CC14:="(char)"}) data_type_color_bs "(" char ")" ;;
	          ${SYN_CC15:="(void*)"}) data_type_color_bs "(" char "*)" ;;
	          ${SYN_CC12:="char*)"}) data_type_color_cr char "* )" ;; 
	          ${SYN_CC13:="(char*"}) data_type_color_bs "(" char "*" ;; 
	          
	          ## ______________ void datatype ______________     
	          ${SYN_VD:=void}) data_type_color void ;;
	          ${SYN_VC1:=,void}) data_type_color_cl , void ;;
	          ${SYN_VC2:=(void}) data_type_color_cl "(" void ;;
	          ${SYN_VC3:=void)}) data_type_color_cr ")" void ;;
	          ${SYN_VC4:="\nvoid"}) data_type_color_cl "\n" void ;;
	          ${SYN_VC5:="\tvoid"}) data_type_color_cl "\t" void ;;
	          ${SYN_VC7:=",void"}) data_type_color_cl "\n\t" void ;;	 	
	          ${SYN_VC8:="\nvoid*"}) data_type_color_bs "\n" void "*" ;; 
	          ${SYN_VC9:="\tvoid*"}) data_type_color_bs "\t" void "*" ;; 
	          ${SYN_VC10:="\n\tvoid*"}) data_type_color_bs "\n\t" void "*" ;; 
	          ${SYN_VC11:=",void*"}) data_type_color_bs "," void "*" ;; 
	          ${SYN_VC14:="(void)"}) data_type_color_bs "(" void ")" ;;
	          ${SYN_VC15:="(void*)"}) data_type_color_bs "(" void "*)" ;;
	          ${SYN_VC12:="void*)"}) data_type_color_cr void "* )" ;; 
	          ${SYN_VC13:="(char*"}) data_type_color_bs "(" void "*" ;; 
	          
	          
	          ## _______________ keywords _____________
	          
	          	## _______ if ______
	          ${SYN_KW_IF_D:=if})  keyword_color if ;;
	          ${SYN_KW_IF_TDBR:="\tif("}) keyword_color_bs "\t" if "(" ;;
	          ${SYN_KW_IF_NLBR:="\nif("}) keyword_color_bs "\n" if "(" ;;
	          ${SYN_KW_IF_TD:="\tif"})  keyword_color_cl "\t" if ;;
	          ${SYN_KW_IF_NLD:="\nif"})  keyword_color_cl "\n" if ;;
	          ${SYN_KW_IF_BR:="if(}"})   keyword_color_cr if "(" ;;
	     
	          	## _______ else ______
	          ${SYN_KW_ELSE_D:=else})  keyword_color else ;;
	          ${SYN_KW_ELSE_TDBR:="\telse("}) keyword_color_bs "\t" else "(" ;;
	          ${SYN_KW_ELSE_NLBR:="\nelse("}) keyword_color_bs "\n" else "(" ;;
	          ${SYN_KW_ELSE_TD:="\telse"})  keyword_color_cl "\t" else ;;
	          ${SYN_KW_ELSE_NLD:="\nelse"})  keyword_color_cl "\n" else ;;
	          ${SYN_KW_ELSE_BR:="else(}"})   keyword_color_cr else "(" ;;
	     
	          
	          	## _______ while ______
	          ${SYN_KW_WHILE_D:=while})  keyword_color while ;;
	          ${SYN_KW_WHILE_TDBR:="\twhile("}) keyword_color_bs "\t" while "(" ;;
	          ${SYN_KW_WHILE_NLBR:="\nwhile("}) keyword_color_bs "\n" while "(" ;;
	          ${SYN_KW_WHILE_TD:="\twhile"})  keyword_color_cl "\t" while ;;
	          ${SYN_KW_WHILE_NLD:="\nwhile"})  keyword_color_cl "\n" while ;;
	          ${SYN_KW_WHILE_BR:="while(}"})   keywccxord_color_cr while "(" ;;
	     		
	     		## ________ do _________
	          ${SYN_KW_DO_D:=do})  keyword_color do ;;
	          ${SYN_KW_DO_TDBR:="\tdo("}) keyword_color_bs "\t" do "(" ;;
	          ${SYN_KW_DO_NLBR:="\ndo("}) keyword_color_bs "\n" do "(" ;;
	          ${SYN_KW_DO_TD:="\tdo"})  keyword_color_cl "\t" do ;;
	          ${SYN_KW_DO_NLD:="\ndo"})  keyword_color_cl "\n" do ;;
	          ${SYN_KW_DO_BR:="do(}"})   keywccxord_color_cr do "(" ;;
     	
     
				## ________ for _________
	          ${SYN_KW_FOR_D:=for})  keyword_color for ;;
	          ${SYN_KW_FOR_TDBR:="\tfor("}) keyword_color_bs "\t" for "(" ;;
	          ${SYN_KW_FOR_NLBR:="\nfor("}) keyword_color_bs "\n" for "(" ;;
	          ${SYN_KW_FOR_TD:="\tfor"})  keyword_color_cl "\t" for ;;
	          ${SYN_KW_FOR_NLD:="\nfor"})  keyword_color_cl "\n" for ;;
	          ${SYN_KW_FOR_BR:="for(}"})   keywccxord_color_cr for "(" ;;
     	
	     
	     
	          	          
	          ## ________________ symbols ________
	          ${SYN_LB:="("}) printsym "(" ;;
	          ${SYN_RB:=")"}) printsym ")" ;;
	          ${SYN_LCB:="{"}) printsym "{" ;;
	          ${SYN_RCB:="}"}) printsym "}" ;;
	          ${SYN_SP:=" "}) printsym " " ;;
	          ${SYN_PLUS:="+"}) printsym "+" ;;
	          ${SYN_MINUS:="-"}) printsym "-" ;;
	          ${SYN_DIV:="/"}) printsym "/" ;;
	       
	          ${SYN_EQEQ:="=="}) printsyn "==" ;;
	          ${SYN_EQ:="="}) printsym "=" ;;
	          ${SYN_GT_EQ:=">="}) printsym ">=" ;;
	          ${SYN_GT:=">"}) printsym ">" ;;
	          ${SYN_LT_EW:="<="}) printsym "<=" ;;
	          ${SYN_LT:="<"}) printsym "<" ;;
	          ${SYN_NOT_LOGICAL_ALT:="!="}) printsym "!=" ;;
	          ${SYN_NOT_LOGICAL:="!"}) printsym "!" ;;
	          
	          ## _______________ values __________
	          ${SYN_INT_VAL:=[0-9]*}) printval "$word" ;;
	          ${SYN_FLOAT_FIX:=\.[0-9]*}) printval "$word" ;;
	          ${SYN_CHAR_VAL:="'"[a-zA-Z]"'"}) printval "$word" ;;
	          ${SYN_BOOL_TRUE:=true}) printval "$word" ;;
	          ${SYN_BOOL_FALSE:=false}) printval "$word" ;;
	          ${SYN_ID:=[a-zA-Z0-9]}) printval "$word" ;;
	          
	          
	          #______ errors ______
	          ${SYN_ERROR:=$}) print_err "$word" ;;
	          ${SYN_ERROR_2:=@}) print_err "$word" ;;
	          ${SYN_ERROR_3:=:}) print_err "$word" ;;
	         esac
	           
}

_help()
{
	printf "Help" 
}
_usage()
{
  printf "usage: syn [str-program]\n" 
  printf " or : synf " 
  
  printf "\n\n"
  printf "syn - highlights c code in the string\n"
  printf "synf - highlights c code in the string retrived from a file\n" 
  printf "\n" 
   return 0
}

syn()
{
    if [ "$1" == "" ]
    then
        _usage 
        return 1
    
    fi
    
    v=$2
    
	line=$1
	p=0

	while [ $p -lt ${#line} ]
	do 
	     c=${line:$p:1}
	     
	      if [ "$c" == " " ] 
	      then
	           printf " " 
	    
	          if [ "$word" == "" ] 
	          then
	              _tmp=$((echo $word))
	          else
	              #_color
	              printf "$word" 
	              word=""
	               
	           fi 
	          word=""
	          
	      elif [ "$c" == "\n" ] 
	        then
	        printf "NL"
	        word=""
	     
	     elif [ "$c" == "\t" ]
	        then
	        #print "\t"
	        word=""
	      else
	         word+="$c"
	         _color
	         ((v == 1)) && echo "dbg : $word " 
	      fi
	     
	    ((p++))
	done
	
	_color
	printf "$word" 
    
}

test()
{
	
 read fl
   ln=$(cat "$fl" )
   syn "$ln     " 

}

synf()
{
    
	printf "Enter filename:" 
	read fl
	while read ln
	do
	     syn "$ln    \n"
	done < "$fl" 
}


#syn "int main (int* argc ,float* argv)\n{ \nint* _x = 10; \nlong* pay = _x ; \n\tchar p = (int*) 20 ;   \n}" 

#syn 'int main () \n{\n \tint j = 0; \n}' 

#syn "$(cat test.c)"
synf


