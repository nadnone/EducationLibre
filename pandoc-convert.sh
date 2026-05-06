MARKDOWN_FILES=$(find . -name "*.md")

cp style.css docs/

mkdir docs/english

mkdir docs/french_main
mkdir docs/french_main/res
cp ./french_main/res/* docs/french_main/res/

mv ./docs/index.html ./docs/index.tmp
rm ./docs/*/*.html
mv ./docs/index.tmp ./docs/index.html

for file in $MARKDOWN_FILES; do
    echo "Converting $file to HTML..."
    pandoc --to html "$file" -o "./docs/${file%.md}.html" --css=/markdown_style.css --standalone

    sed 's/\.md/\.html/g' "./docs/${file%.md}.html" > "./docs/${file%.md}.html.tmp"
    cp  "./docs/${file%.md}.html.tmp" "./docs/${file%.md}.html"
    rm  "./docs/${file%.md}.html.tmp"
done