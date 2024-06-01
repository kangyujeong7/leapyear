#평년 lm=0
#윤년 lm(leap year)=1

#!/bin/bash
if [ ! "$#" -eq 3 ]; then
    echo "입력값 오류"
    exit 1
fi


month=$1
day=$2
year=$3


case "$month" in
    [j,J]an|[J,j]anuary|1) month="Jan" ;;
    [f,F]eb|[F,f]ebruary|2) month="Feb" ;;
    [m,M]ar|[M,m]arch|3) month="Mar" ;;
    [a,A]pr|[A,a]pril|4) month="Apr" ;;
    [m,M]ay|5) month="May" ;;
    [j,J]un|[J,j]une|6) month="Jun" ;;
    [j,J]ul|[J,j]uly|7) month="Jul" ;;
    [a,A]ug|[A,a]ugust|8) month="Aug" ;;
    [s,S]ep|[S,s]eptember|9) month="Sep" ;;
    [o,O]ct|[O,o]ctober|10) month="Oct" ;;
    [n,N]ov|[N,n]ovember|11) month="Nov" ;;
    [d,D]ec|[D,d]ecember|12) month="Dec" ;;
    *)
        echo "$month은 유효한 월이 아닙니다."
        exit 1
        ;;
esac

if (( year % 4 == 0 )); then
    if (( year % 400 == 0 )); then
        lm=1
    elif (( year % 100 == 0 )); then
        lm=0
    else
        lm=1
    fi
else
    lm=0
fi

case $month in
    Jan|Mar|May|Jul|Aug|Oct|Dec) date-in-the month=31 ;;
    Apr|Jun|Sep|Nov) date-in-the month=30 ;;
    Feb)
        if [ $lm -eq 1 ]; then
            date-in-the month=29
        else
           date-in-the month=28
        fi
        ;;
esac

if (( (day > 30 && (month == "Apr" || month == "Jun" || month == "Sep" || month == "Nov")) ||
      (day > 29 && month == "Feb") ||
      (day > 31) )); then
    echo "$month $day $year은 유효하지 않은 날짜입니다."
    exit 1
fi




echo "${month^} $day $year"
exit 0