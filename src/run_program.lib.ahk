RG_RunProgram(programs*){
    For index, program in programs {
        if FileExist(program){
            ToolTip("Run " . program)
            Run % program
            Return True
        }
    }
    Return False
}