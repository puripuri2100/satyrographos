Prepare SATySFi source
  $ cat >first.saty <<EOF
  > @import: second1
  > @import: second2/lib
  > EOF
  $ cat >second1.satyh <<EOF
  > EOF
  $ mkdir second2
  $ cat >second2/lib.satyg <<EOF
  > EOF

Dep files
  $ SATYROGRAPHOS_EXPERIMENTAL=1 satyrographos util deps-make -S 0.0.5 --phony-targets --depfile deps.d -o first.pdf --follow-required first.saty
  Compatibility warning: You have opted in to use experimental features.
  $ cat deps.d
  first.pdf: first.saty second2/lib.satyg second1.satyh
  
  deps.d: first.saty second2/lib.satyg second1.satyh
  
  first.saty:
  
  second1.satyh:
  
  second2/lib.satyg:
  
