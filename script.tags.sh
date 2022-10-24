if [ $# -ge 1 ]
then
    t=$1
else
    t=i
fi
tags= ${{ github.event.inputs.includeTags }}
IFS=',' read -r -a array <<< "$tags"
for i in "${array[@]}"
do
	final_tags=$final_tags" -$t $i"
done
echo ${{ github.event.inputs.includeTags }}