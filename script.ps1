
$version = git describe --tags --abbrev=0 
if  ([version]::IsNullOrEmpty)
{
    $NEW_TAG="V1.0.0"
    echo "No tag present."
    echo "Creating tag: $NEW_TAG"
    git tag $NEW_TAG
    git push --tags
    echo "Tag created and pushed: $NEW_TAG"
  
}
else
{
$newvar=$version.Split(".")
[string]$var1=$newvar[0]
[int]$var2=$newvar[1]
[int]$a=$newvar[2]
[int]$b=1
[int]$c=[int]$a+[int]$b

$NEW_TAG="$var1.$var2.$c"

echo "Updating $version to $NEW_TAG"
$GIT_COMMIT = git rev-parse HEAD
echo "$GIT_COMMIT"
$NEEDS_TAG = git describe --contains $GIT_COMMIT
if ($NEEDS_TAG)
{
    git tag $NEW_TAG
    echo "Tagged with $NEW_TAG"
    git push --tags
}
else
{
    echo "Already a tag on this commit"

}
}