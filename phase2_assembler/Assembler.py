#******************************
#******************************
#******************************
#    Assembler for CA project
#    Kian, Adrina and Alireza
#       MAY 2022, Isfahan
#******************************
#******************************
#******************************
 

#Functions:
def ReadMipsFile(path: str) -> list:
    return open(path, 'r').readlines()

def NormalizeEachLine(lines: list) -> list:
    
    for index in range(len(lines)):
        lines[index] = lines[index].strip().split()
        for word_index in range(len(lines[index])):
            if ',' in lines[index][word_index]:
                lines[index][word_index] = lines[index][word_index][:-1]
    
    label_dict = {}
    
    for index in range(len(lines)):
        if ':' in lines[index][0]:
            label_dict[lines[index][0][:-1]] = '00'+ ('0'*(14-len(hex(index)[2:])))+ hex(index)[2:]
            _ = lines[index].pop(0)
    
    for index in range(len(lines)):
        for sub_index in range(len(lines[index])):
            if lines[index][sub_index] in label_dict:
                lines[index][sub_index] = label_dict[lines[index][sub_index]]
            
    return lines


def Decoder(lines: list) -> list:
    # dicts:
    R_op_dict={
        'add': '000000',
        'sub': '000001',
        'and': '000010',
        'or': '000011',
        'nor': '000100',
        'xor': '000101',
        'slt': '001000',
        'seq': '001001',
     }

    R_fun_dict={
        'add': '11111',
        'sub': '11110',
        'and': '11101',
        'or': '11100',
        'nor': '11011',
        'xor': '11010',
        'slt': '11000',
        'seq': '10000',
    }

    I_op_dict={
        'addi': '000000',
        'lw': '000001',
        'sw': '000010',
        'andi': '000011',
        'ori': '000100',
        'beq': '000101',
        'bne': '001000',
    }

    register_value = []
    for i in range(32):
        register_value.append(
            '00'+('0'*(3-len(hex(i)[2:])))+ hex(i)[2:]
        )

    register_key = [
        'zero', 'at', 'v0', 'v1', 'a0', 'a1', 'a2', 'a3',
        't0', 't1', 't2', 't3', 't4', 't5', 't6', 't7',
        's0', 's1', 's2', 's3', 's4', 's5', 's6', 's7',
        't8', 't9', 'k0', 'k1', 'gp', 'sp', 'fp', 'ra',
        ]

    register_dict={}

    for k, v in zip(register_key, register_value):
        register_dict['$'+k] = v
    
    assemly_output = []

    # decoder operations:
    for word in lines:
        if word[0] in R_op_dict:
            # add rd, rs, rt
            # -> op(6) rs rt rd constant fun(6)

            assemly = ''
            assemly += R_op_dict[word[0]] # op            
            assemly += register_dict[word[2]] # rs
            assemly += register_dict[word[-1]] # rt
            assemly += register_dict[word[1]] # rd
            assemly += '00000' #constant
            assemly += R_fun_dict[word[0]] #fun 

            assemly_output.append(assemly)
        
        
        elif word[0] in I_op_dict:
            # op rs rt immidiate/address

            assemly = ''
            assemly += I_op_dict[word[0]] # op  
            assemly += register_dict[word[1]] #rs
            assemly += register_dict[word[2]] #rt

            if len(word[3]) == 16:
                assemly += word[3] # address
            else:
                assemly += '0'*(16-len(str(bin(int(word[3])))[2:])) + str(bin(int(word[3])))[2:] #immidiate

            assemly_output.append(assemly)
        
        else:
            assemly = '111111'
            assemly += '0'*(26-len(str(bin(int(word[-1])))[2:])) + str(bin(int(word[-1])))[2:]
            assemly_output.append(assemly)

        return assemly_output

def SaveFile(path: str, list_for_write: list):
    f = open(path, 'w')
    for line in list_for_write:
        f.write(line)
        f.write('\n')
    f.close()

# main 
if __name__ == "__main__":
    open_path = input('please enter mips file path')
    save_path = input('please enter path for saving')
    
    SaveFile(save_path,
        Decoder(
                NormalizeEachLine(
                    ReadMipsFile(open_path)
                )
            )
    )
