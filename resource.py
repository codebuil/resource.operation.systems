import os

def create_resource_files(input_file):
    # Defina os nomes dos arquivos de saída .raw e .c
    raw_file = os.path.splitext(input_file)[0] + ".raw"
    c_file = os.path.splitext(input_file)[0] + ".c"

    # Abra o arquivo de entrada e os arquivos de saída
    with open(input_file, "r") as input_file, open(raw_file, "wb") as raw_output, open(c_file, "w") as c_output:
        resource_address = 0x60000
        resource_addresss=resource_address
        for line in input_file:
            key, value = line.strip().split("=")

            # Verifique o tipo de valor (inteiro ou string)
            print(value)
            if len(value)>1:
                if value.isdigit():
                    # É um inteiro, converta-o e escreva em binário no arquivo .raw
                    int_value = int(value)
                    raw_output.write(int_value.to_bytes(4, byteorder="big", signed=True))
                    resource_type = "int"
                    resource_addresss +=4 if resource_type == "int" else len(value) + 1
                else:
                    # É uma string, escreva em binário no arquivo .raw
                    #print(value)
                    value=value+"\0"
                    v=value.encode("utf-8")
                    raw_output.write(v)
                    resource_type = "char"
                    resource_addresss +=len(v) if resource_type == "int" else len(value) + 1

            # Escreva as informações do recurso no arquivo .c
            c_output.write(f"extern {resource_type} {key};\n")
            c_output.write(f"const {resource_type} {key} = (const {resource_type} *)(0x{resource_address:08X});\n\n")

            # Atualize o endereço do recurso
            resource_address = resource_addresss
print("\033c\033[44;37m\n")
input_file = input("Informe o nome do arquivo de entrada: ")
create_resource_files(input_file)
print("Arquivos .raw e .c foram criados com sucesso!")

