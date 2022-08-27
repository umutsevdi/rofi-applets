#! /bin/bash
# applet_cli.sh - Command line interface to run Rofi Applets
# @author umutsevdi 
# @requires rofi

# Set to default path if applet path is not defined
[ "$ROFI_APPLETS_PATH" = "" ] && ROFI_APPLETS_PATH=$HOME/.dotfiles/applets/
options=`ls -d $ROFI_APPLETS_PATH/*/ | sed "s#$ROFI_APPLETS_PATH##g" | tr "/" " "`
[ "$options" = "" ] && echo "error: No applet were found at $ROFI_APPLETS_PATH directory.\nEither move applets to the $ROFI_APPLETS_PATH or define \$ROFI_APPLETS_PATH at .bashrc" 1>&2
 

Help()
{
   # Display Help
   echo "applet.sh - Applet Launcher Interface"
   echo "──────────────────────────────────────────────"
   echo "Command line interface to run Rofi Applets"
   echo
   echo "Syntax: [-r]"
   echo "Options:"
   echo "┌────────────────────────────────────────────┐"
   echo "│ -h/--help          Prints this menu.       │"
   echo "│ -r/--run \$app      Runs selected applet    │"
   echo "└────────────────────────────────────────────┘"
   echo " Applets:"
   [ "$options" = "" ] && echo "error: No applet were found at $ROFI_APPLETS_PATH directory.\nEither move applets to the $ROFI_APPLETS_PATH or define \$ROFI_APPLETS_PATH at .bashrc" 1>&2 || " `echo $options`"
   echo
}

Run()
{
    sh $ROFI_APPLETS_PATH/$app/launch.sh 2>/dev/null
}

if [[ "$#" -eq 0 ]]; then
    Help
    exit
fi
for arg in $@;do
    if   [ "$arg" = "-h" ] || [ "$arg" = "--help" ]; then
        Help
        exit
    elif [ "$run" = true ]; then 
        app=$arg
        case "$options" in 
          *$app*)
           Run
           exit
           ;;
        esac
        echo "error: Applet was not found." 1>&2
    elif [ "$arg" = "-r" ] || [ "$arg" = "--run" ]; then 
        run=true
    else
        echo -e "Error: Invalid arguments" 1>&2
        exit
    fi 
done

