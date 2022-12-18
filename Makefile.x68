CC=gcc

# on some systems the termcap library is in -ltermcap
TERMLIB =

default: hack.x

# make hack
GAME = hack.x
GAMEDIR = /usr/games/lib/hackdir
# -DMULTIUSER_LOCK for systems that can respect this old locking schema
#
CFLAGS = -DMSDOS

LIB1 = decl.o apply.o bones.o hack.o cmd.o do.o\
	do_name.o do_wear.o dog.o eat.o end.o\
	engrave.o fight.o invent.o pcioctl.o

LIB2 = lev.o makemon.o mhitu.o mklev.o\
	mkmaze.o mkobj.o mkshop.o mon.o\
	monst.o o_init.o objnam.o options.o

LIB3 = pager.o potion.o pri.o\
	read.o rip.o rumors.o save.o\
	search.o shk.o shknam.o steal.o

LIB4 = termpc.o timeout.o topl.o\
	track.o trap.o pctty.o unix.o\
	u_init.o vault.o wield.o
	
LIB5 = wizard.o worm.o worn.o zap.o\
	version.o rnd.o alloc.o x68k.o

OBJ = $(LIB1) $(LIB2) $(LIB3) $(LIB4) $(LIB5)

lib1.a:	$(LIB1)
	run68 ar /b lib1.a $(LIB1)

lib2.a:	$(LIB2)
	run68 ar /b lib2.a $(LIB2)

lib3.a:	$(LIB3)
	run68 ar /b lib3.a $(LIB3)

lib4.a:	$(LIB4)
	run68 ar /b lib4.a $(LIB4)

lib5.a:	$(LIB5)
	run68 ar /b lib5.a $(LIB5)

LIBS = lib1.a lib2.a lib3.a lib4.a lib5.a

$(GAME): $(LIBS) main.o
	@echo "Loading ..."
	$(CC) main.o $(LIBS) -o hack.x
#	@$(CC) -o $(GAME) $(HOBJ) $(TERMLIB) 

all:	$(GAME) lint
	@echo "Done."

makedefs.x:	makedefs.c
	$(CC) -o makedefs.x makedefs.c


onames.h:	makedefs.x objects.h
	run68 makedefs > onames.h



clean:
	del /F $(OBJ) $(LIBS) lib?.bak makedefs.x onames.h h hack.x main.o



# DO NOT DELETE THIS LINE

decl.o: onames.h 
apply.o: onames.h
bones.o: onames.h
hack.o: onames.h
cmd.o: onames.h 
do.o: onames.h
do_name.o: onames.h
do_wear.o: onames.h
dog.o: onames.h mfndpos.h edog.h mkroom.h
eat.o: onames.h
end.o: onames.h
engrave.o: onames.h
fight.o: onames.h
invent.o: onames.h wseg.h
ioctl.o:  config.h
lev.o: onames.h mkroom.h wseg.h
main.o: onames.h
makemon.o: onames.h
mhitu.o: onames.h
mklev.o: onames.h mkroom.h
mkmaze.o: onames.h mkroom.h
mkobj.o: onames.h
mkshop.o: onames.h mkroom.h eshk.h
mon.o: onames.h mfndpos.h
monst.o: onames.h eshk.h
o_init.o:  config.h objects.h onames.h
objnam.o: onames.h
options.o:  config.h
pager.o: onames.h
potion.o: onames.h
pri.o: onames.h wseg.h
read.o: onames.h
rip.o: onames.h
rumors.o: onames.h
save.o: onames.h
search.o: onames.h
shk.o: onames.h mfndpos.h mkroom.h eshk.h
shknam.o: onames.h
steal.o: onames.h
termpc.o:  config.h flag.h
timeout.o: onames.h
topl.o: onames.h
track.o: onames.h
trap.o: onames.h mkroom.h
tty.o: onames.h
unix.o: onames.h mkroom.h
u_init.o: onames.h
vault.o: onames.h mkroom.h
wield.o: onames.h
wizard.o: onames.h
worm.o: onames.h wseg.h
worn.o: onames.h
zap.o: onames.h
version.o:  date.h
x68k.o: onames.h
#h:  config.h objclass.h monst.h gold.h trap.h obj.h flag.h rm.h permonst.h onames.h
#	copy /Y blank h
#objects.h:  config.h objclass.h
#			touch objects.h
# DEPENDENCIES MUST END AT END OF FILE
# IF YOU PUT STUFF HERE IT WILL GO AWAY
# see make depend above
