#! /bin/sh

graphviz_prefix="/usr/local/Cellar/graphviz"

if [ -d "$graphviz_prefix" ]; then
  # TODO: assumes only one verison of graphviz is installed
  graphviz_version=$(ls "$graphviz_prefix")
  if [ "$graphviz_version" ]; then
    graphviz_app='Graphviz.app'
    graphviz_app_path="$graphviz_prefix/$graphviz_version/$graphviz_app"
    if [ -d "$graphviz_app_path" ]; then
      echo "Copying Graphiz app into Applications folder ..."
      cp -r "$graphviz_app_path" "/Applications/"
    else
      echo "Graphviz formula installed without the app flag. Resolve with:"
      echo "brew uninstall graphviz && brew install graphviz --with-app"
    fi
  else
    echo "Unable to find graphviz formula"
    echo "Install with brew install graphviz --with-app"
  fi
fi
