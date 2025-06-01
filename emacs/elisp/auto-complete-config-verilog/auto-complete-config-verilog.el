
(provide 'auto-complete-config-verilog)
(eval-when-compile
  (require 'cl))
(require 'auto-complete)

(defvar ac-source-verilog
  '((candidates . (list
                   ;; block
                   "module" "endmodule"
                   "class" "endclass"
                   "interface" "endinterface"
                   "primitive" "endprimitive"
                   "table" "endtable"
                   "for" "while"
                   "case" "casex" "casez" "randcase" "endcase"
	               "package" "endpackage"
                   "forever" "initial" "final"
                   "begin" "else" "end"
                   "fork" "join" "join_any" "join_none"
                   "generate" "endgenerate"
                   "task" "endtask"
                   "function" "endfunction"
                   "program" "endprogram"
                   "specify" "endspecify"
                   ;; func
                   "assign" "deassign"
                   "always" "always_comb" "always_ff" "always_latch"
                   "posedge" "negedge"
                   "force" "release"
                   "return" "break" "continue"
                   "repeat" "priority" "unique" "wait"
                   "default" "disable" 
                   ;; define
                   "`define"
                   "`ifdef" "`elsif" "`else" "`endif"
                   "`timescale"
                   "`default_nettype"
                   "`include"
                   ;;variable
                   "input" "output" "inout"
                   "parameter" "localparam" "defparam"
                   "reg"
                   "wire" "wand" "wor"
                   "and" "nand" "or" "nor" "xor" "xnor" "not"
                   "notif0" "notif1"
                   "buf" "bufif0" "bufif1"
                   "tran" "tranif0" "tranif1"
                   "rtran" "rtranif0" "rtranif1"
                   "tri" "tri0" "tri1"
                   "triand" "trior" "trireg"
                   "bit" "logic"
                   "int" "longint" "shortint"
                   "integer" "string" "byte"
                   "real" "realtime" "time"
                   "genvar" "event"
                   ;;type
                   "this" "super"
                   "static" "automatic" "rand" "randc" "const"
                   "enum" "union" "typedef" "struct" "virtual"
                   ;;assertion
                   "assert"
                   ;;other
                   "extends" "new" "modport"
                   ;;task
                   "$finish()" "$stop()"
                   "$display()" "$displayb()" "$displayh()" "$displayo()"
                   "$sformat()" "$sformatf()"
                   "$write()" "$writeb()" "$writeh()" "$writeo()"
                   "$realtime()" "$stime()" "$time()"
                   "$signed()" "$unsigned()"
                   "$random()"
                   "$clog2"
                   "$fopen()" "$fclose()"
                   "$fdisplay()" "$fdisplayb()" "$fdisplayh()" "$fdisplayo()"
                   "$fwrite()" "$fwriteb()" "$fwriteh()" "$fwriteo()"
                   "$fgetc()" "$fgets()" "$fread()" "fscanf()"
                   "$readmemh()" "$readmemb()"
                   ))))
	      

	         
	      
   
