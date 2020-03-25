$version=git describe --tags $(git rev-list --tags --max-count=1)
if  ($version -eq $null )
{
    $NEW_TAG="V1.0.0"
    echo "No tag present."
    echo "Creating tag: $NEW_TAG"
    git tag $NEW_TAG
    git push --tags
    echo "Tag created and pushed: $NEW_TAG"
  
}