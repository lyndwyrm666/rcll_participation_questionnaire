# ############################################################################
#    ┌──┬──┐ ┌─────┐ ┌─────┐ ┌─────┐ ┌─────┐ ┬────┐        ▒▒▒▒▒░░░░░▓▓▓▓▓
#    │  │  │ ├─────┤ └─────┐ │       │     │ ├───┬┘        FH Aachen
#    ┘     └ ┘     └ └─────┘ └─────┘ └─────┘ ┘   └─        University of
#    Mobile Autonomous Systems & Cognitive Robotics        Applied Sciences
# ############################################################################

## OPTIONS ################

SILENT = @

## #################################### ##
##  VARIABLES                           ##
## #################################### ##

## FILES ##################

quest  = rcll_participation_questionnaire

## COMMANDS ###############

MSG    = echo
PDFLTX = pdflatex
LTXOPT = -shell-escape
BIBLTX = bibtex
BIBOPT = 

## COLORS #################

RESET       = tput sgr0
#
BLACK       = tput setaf 0
BLACK_BG    = tput setab 0
DARKGREY    = tput setaf 0; tput bold
RED         = tput setaf 1
RED_BG      = tput setab 1
LIGHTRED    = tput setaf 1; tput bold
GREEN       = tput setaf 2
GREEN_BG    = tput setab 2
LIME        = tput setaf 2; tput bold
BROWN       = tput setaf 3
BROWN_BG    = tput setab 3
YELLOW      = tput setaf 3; tput bold
BLUE        = tput setaf 4
BLUE_BG     = tput setab 4
BRIGHTBLUE  = tput setaf 4; tput bold
PURPLE      = tput setaf 5
PURPLE_BG   = tput setab 5
PINK        = tput setaf 5; tput bold
CYAN        = tput setaf 6
CYAN_BG     = tput setab 6
BRIGHTCYAN  = tput setaf 6; tput bold
LIGHTGREY   = tput setaf 7
LIGHTGREYBG = tput setab 7
WHITE       = tput setaf 7; tput bold

## NAMED-HELPER ###########

MENU  = $(CYAN)
ITEM  = $(BRIGHTCYAN)
DONE  = $(CYAN)
CHECK = $(GREEN)
ERROR = $(RED)

## #################################### ##
##  R U L E S                           ##
## #################################### ##


all: questionnaire


questionnaire:
	${SILENT} $(MENU); ${MSG} " -- Compiling file '$(quest)' ... "; $(RESET)
	${SILENT} $(ITEM); ${MSG} " --- 1st pdfLaTeX run on $(quest) ... "; $(RESET)
	${SILENT} ${PDFLTX} ${LTXOPT} $(quest).tex

opt:
	${SILENT} $(MENU); ${MSG} " --- Creating size-optimized version of '$(quest)' ... "
	${SILENT} gs -q -dOptimize=true -dNOPAUSE -dSAFER -sDEVICE=pdfwrite -sOutputFile=$(quest)-opt.pdf $(quest).pdf  -c quit
	${SILENT} $(DONE); ${MSG} " -> DONE. ($(quest)-opt)"


clean:
	${SILENT} $(MENU); ${MSG} " -- Cleaning up ... "; $(RESET)
	${SILENT} rm -f *~ *.aux *.bbl *.blg *.log *.out
	${SILENT} $(DONE); ${MSG} " -> DONE. (clean)"; $(RESET)
