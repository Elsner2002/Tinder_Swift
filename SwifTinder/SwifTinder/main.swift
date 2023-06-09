//
//  main.swift
//  SwifTinder
//
//  Created by Felipe  Elsner Silva e Fabricio Masiero on 21/03/23.
//

import Foundation
import AVFoundation

//MARK: Erros
enum Erros: Error {
    case invalidOptionMenu
    case invalidFisic
    case invalidHeight
    case invalidHobbie
    case invalidSex
    case invalidOptionEdit
    case invalidTwoOptions
    case invalidAge
    case invalidDate
    case invalidName
    case missOption
    case invalidMatch
}

func validadeMatch(value: Int, str: String) throws{
    if value < 0 || value >= 3 {
        throw Erros.invalidMatch
    }
    guard (str.range(of: "[0-9]", options: .regularExpression) != nil) else {
        throw Erros.invalidMatch
    }
}

func validadeOptionMenu(value: Int, str: String) throws {
    if value < 0 || value >= 5 {
        throw Erros.invalidOptionMenu
    }
    guard (str.range(of: "[0-9]", options: .regularExpression) != nil) else {
        throw Erros.invalidOptionMenu
    }
}

func validadeSex(value: Int, str: String) throws {
    if value <= 0 || value >= 4 {
        throw Erros.invalidSex
    }
    guard (str.range(of: "[0-9]", options: .regularExpression) != nil) else {
        throw Erros.invalidSex
    }
}

func validadeHeight(value: Int, str: String) throws {
    if value < 1 || value > 4{
        throw Erros.invalidHeight
    }
    guard (str.range(of: "[0-9]", options: .regularExpression) != nil) else {
        throw Erros.invalidHeight
    }
}

func validadeFisic(value: Int, str: String) throws {
    if value < 1 || value > 5{
        throw Erros.invalidFisic
    }
    guard (str.range(of: "[0-9]", options: .regularExpression) != nil) else {
        throw Erros.invalidFisic
    }
}

func validadeOptionTwo(value: Int, str: String) throws {
    if value < 1 || value > 2 {
        throw Erros.invalidTwoOptions
    }
    guard (str.range(of: "[0-9]", options: .regularExpression) != nil) else {
        throw Erros.invalidTwoOptions
    }
}

func validadeHobbie(value: Int, str: String) throws {
    if value < 0 || value >= 13 {
        throw Erros.invalidHobbie
    }
    guard (str.range(of: "[0-9]", options: .regularExpression) != nil) else {
        throw Erros.invalidHobbie
    }
}

func validadeOptionEdit(value: Int, str: String) throws {
    if value < 0 || value >= 7 {
        throw Erros.invalidOptionEdit
    }
    guard (str.range(of: "[0-9]", options: .regularExpression) != nil) else {
        throw Erros.invalidOptionEdit
    }
}

func validadeAge(age: Int) throws{
    if age < 18 || age > 100 {
        throw Erros.invalidAge
    }
}

func validadeName(name: String) throws {
    
    guard (name.range(of: "[a-zA-Z]", options: .regularExpression) != nil) else {
        throw Erros.invalidName
    }
    
}

func missingOption(option: String) throws{
    if option.isEmpty {
        throw Erros.missOption
    }
}

func validadeDate(data: String) throws{
    if data.count != 10 && !(data.contains("/")) && !(data.contains("1") || data.contains("2") || data.contains("3") || data.contains("4") || data.contains("5") || data.contains("6") || data.contains("7") || data.contains("8") || data.contains("9") || data.contains("0")){
        throw Erros.invalidDate
    }
}

//MARK: Função do Som
var player: AVAudioPlayer!
func playMatchSound() {
    let som = Int.random(in: 1...4)
    switch som{
        case 1:
            if let url = Bundle.main.url(forResource: "Ele gosta", withExtension: "mp3"){
                player = try? AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                player.play()
            }
        case 2:
            if let url = Bundle.main.url(forResource: "Demais", withExtension: "mp3"){
                player = try? AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                player.play()
            }
        case 3:
            if let url = Bundle.main.url(forResource: "ira", withExtension: "mp3"){
                player = try? AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                player.play()
            }
        case 4:
            if let url = Bundle.main.url(forResource: "ui", withExtension: "mp3"){
                player = try? AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                player.play()
            }
        default:
            fatalError()
    }
    

}

//MARK: Enums

//Todos os enums tem um init para escolher pelo número e uma descrição para prints futuros
enum Alturas {
    case alto
    case medio
    case baixo
    case qualquerA
    init(indice : Int){
        
        switch indice{
        case 1:
            self = .alto
            
        case 2:
            self = .medio
            
        case 3:
            self = .baixo
                
        case 4:
            self = .qualquerA
                
        default:
            //erro
            fatalError("Error")
        }
    }
    var descricao : String{
        switch self{
        case .alto:
            return "Alto"
        case .medio:
            return "Médio"
        case .baixo:
            return "Baixo"
        case .qualquerA:
            return "Todos"
        }
    }
}

enum Fisicos{
    case magro
    case gordo
    case musculoso
    case poucoMusculo
    case qualquerF
    init(indice: Int) {
        switch indice{
        case 1:
            self = .magro
            
        case 2:
            self = .gordo
            
        case 3:
            self = .musculoso
            
        case 4:
            self = .poucoMusculo
                
        case 5:
            self = .qualquerF
                
        default:
            //erro
            fatalError("Error")
        }
    }
    var descricao : String{
        switch self{
        case .magro:
            return "Seco"
        case .gordo:
            return "Barriguinha"
        case .musculoso:
            return "Tanquinho"
        case .poucoMusculo:
            return "Pouco Definido"
        case .qualquerF:
            return "Todos"
        }
    }
}

enum Gostos {
    case jogos
    case esportes
    case viagens
    case filmes
    case series
    case natureza
    case praia
    case festas
    case fumar
    case bebidasAlcolicas
    case musica
    case academia
    
    init(indice : Int){
        switch indice {
        case 1:
            self = .jogos
        case 2:
            self = .esportes
        case 3:
            self = .viagens
        case 4:
            self = .filmes
        case 5:
            self = .series
        case 6:
            self = .natureza
        case 7:
            self = .praia
        case 8:
            self = .festas
        case 9:
            self = .fumar
        case 10:
            self = .bebidasAlcolicas
        case 11:
            self = .musica
        case 12:
            self = .academia
        default:
            fatalError("Error")
        }
    }
    
    var descricao : String{
        switch self{
        case .jogos:
            return "Jogos"
        case .esportes:
            return "Esportes"
        case .viagens:
            return "Viagens"
        case .filmes:
            return "Filmes"
        case .series:
            return "Séries"
        case .natureza:
            return "Natureza"
        case .praia:
            return "Praia"
        case .festas:
            return "Festas"
        case .fumar:
            return "Fumar"
        case .bebidasAlcolicas:
            return "Bebidas Alcólicas"
        case .musica:
            return "Música"
        case .academia:
            return "Academia"
        }
    }
}

enum Sexos {
    case masculino
    case feminino
    case ambos
    init(indice : Int){
        switch indice{
        case 1:
            self = .masculino
            
        case 2:
            self = .feminino
            
        case 3:
            self = .ambos
            
        default:
            //erro
            fatalError("Error")
        }
    }
    var descricao : String{
        switch self{
        case .masculino:
            return "Masculino"
        case .feminino:
            return "Feminino"
        case .ambos:
            return "Ambos"
        }
    }
}

//MARK: classes e protocol

//protocol da base das pessoas
protocol Pessoas {
    var nome: String {get}
    var idade: Int {get}
    var altura: Alturas {get set}
    var fisico: Fisicos {get set}
    var gostos: [Gostos?] {get set}
    var sexo: Sexos {get set}
    
    func toString()
}

// classe do usuário que estará usando a aplicação
class Usuario : Pessoas{
    
    var nome: String
    var idade: Int
    var dataNascimento: Date
    var altura: Alturas
    var fisico: Fisicos
    var gostos: [Gostos?]
    var rangeIdade: Int
    var idadeMax: Int
    var idadeMin: Int
    var listaMatch: [Pessoas]
    var sexo: Sexos
    
    init(nome: String, dataNascimento: Date, altura: Alturas, fisico: Fisicos, gostos: [Gostos], rangeIdade: Int, sexo: Sexos) {
        self.nome = nome
        self.dataNascimento = dataNascimento
        let dataAtual = Calendar.current
        let ano = dataAtual.dateComponents([.year], from: self.dataNascimento, to: Date())
        let idadeV = ano.year ?? 18
        self.idade = 0
        do{
            try validadeAge(age: idadeV)
            self.idade = idadeV
        }
        catch Erros.invalidAge{
            fatalError("Você precisa ter mais de 18 anos para usar esse App")
        }
        catch{
            print("Error")
        }
        
        self.altura = altura
        self.fisico = fisico
        self.gostos = gostos
        self.rangeIdade = rangeIdade
        
        if (self.idade + self.rangeIdade) > 100{
            idadeMax = 100
        }
        else{
            idadeMax = self.idade + self.rangeIdade
        }
        if (self.idade - self.rangeIdade) < 18{
            idadeMin = 18
        }
        else{
            idadeMin = self.idade - self.rangeIdade
        }
        listaMatch = []
        self.sexo = sexo
    }
    
    func toString() {
        print("\(self.nome), suas preferencias atuais são:\n\nAltura: \(self.altura.descricao)\nFísico: \(self.fisico.descricao)")
        print("Menor idade \(idadeMin) e Maior idade \(idadeMax)\nSexo:\(self.sexo.descricao)\nGostos de preferência:")
        for gosto in self.gostos {
            if let g = gosto{
                print(g.descricao)
            }
        }
    }
    
    func listaDeMatches(){
        print("------------------------------------------------------------------------------------")
        for m in listaMatch{
            m.toString()
            print("\n------------------------------------------------------------------------------------\n")
        }
    }
    
    func newRange(){
        if (self.idade + self.rangeIdade) > 100{
            idadeMax = 100
        }
        else{
            idadeMax = self.idade + self.rangeIdade
        }
        if (self.idade - self.rangeIdade) < 18{
            idadeMin = 18
        }
        else{
            idadeMin = self.idade - self.rangeIdade
        }
    }
}

//classe dos pretendentes aleatórios do usuário
class Pretendentes : Pessoas{
    
    var sexo: Sexos
    var nome: String
    var idade: Int
    var altura: Alturas
    var fisico: Fisicos
    var gostos: [Gostos?]
    var deuMatch: Bool
    var possivelPretendente: Bool
    
    init(sexo : Sexos, nome : String) {
        self.sexo = sexo
        self.nome = nome
        deuMatch = false
        altura = Alturas(indice: Int.random(in: 1...3))
        fisico = Fisicos(indice: Int.random(in: 1...4))
        possivelPretendente = false
        var escolhidos : [Int] = []
        gostos = [.jogos, .jogos, .jogos, .jogos, .jogos]
        for i in 0...4{
            var g = Int.random(in: 1...12)
            while escolhidos.contains(g){
                g = Int.random(in: 1...12)
            }
            escolhidos.append(g)
            gostos[i] = Gostos(indice: g)
        }
        
        self.idade = Int.random(in: 18 ... 100)
    }
    
    func toString() {
        print("\n\(self.nome) - \(self.idade) anos\nAltura: \(self.altura.descricao)\nFísico: \(self.fisico.descricao)\nSexo: \(self.sexo.descricao)\nGostos:")
        for gosto in self.gostos {
            if let g = gosto{
                print(g.descricao)
            }
        }
    }
}

//MARK: funções

//funcao que pede a altura de preferencia do usuário
func digiteAltura() -> Alturas{
    print("\nDigite a altura ideal para o seu match! \n[1] - Alto (alturas maiores que 1,86m)\n[2] - Médio (alturas entre 1,66m e 1,85m)\n[3] - Baixo (alturas até 1,65m)\n[4] - Gosto de todos")
    var alturaNum = 0
    var validA = true
    while validA{
        let entradaAltura = readLine()
        do{
            if let str = entradaAltura {
                if let num = Int(str){
                    try validadeHeight(value: num, str: str)
                    alturaNum = num
                }
            }
            validA = false
        }
        catch Erros.invalidHeight{
            print("\nOpção inválida. Digite uma das seguintes opções:\n[1] - Alto (Acima de 1,86m)\n[2] - Médio (Entre 1,66m e 1,85m)\n[3] - Baixo (Até 1,65m)\n[4] - Gosto de todos")
        }
        catch{
            print("Error")
        }
    }
    return Alturas(indice: alturaNum)
}

//funcao que pede o físico de preferencia do usuário
func digiteFisico() -> Fisicos{
    print("\nDigite o tipo físico ideal para o seu match! \n[1] - Seco \n[2] - Barriguinha \n[3] - Tanquinho \n[4] - Pouco definido\n[5] - Gosto de todos")
    var fisicoNum = 0
    var validF = true
    while validF{
        let entradaFisico = readLine()
        do{
            if let str = entradaFisico {
                if let num = Int(str){
                    try validadeFisic(value: num, str: str)
                    fisicoNum = num
                }
            }
            validF = false
        }
        catch Erros.invalidFisic{
            print("Digite uma das opcoes validas:\n[1] - Seco \n[2] - Barriguinha \n[3] - Tanquinho \n[4] - Pouco definido\n[5] - Gosto de todos")
        
        }
        catch{
            print("Error")
        }
    }
    return Fisicos(indice: fisicoNum)
}

//funcao que pede os interesses de preferencia do usuário
func digiteGostos() -> [Gostos]{
    var continuar = 0
    var gostoNum = 0
    var gostosU: [Gostos] = []
    print("\nNos diga até 5 coisas que você gosta para encontrarmos seu Match.")
    for i in 0...4{
        var verifGost = true
        print("\nEscolha o \(i + 1)º interesse dentre os seguintes: \n[1] - Jogos \n[2] - Esportes \n[3] - Viagens \n[4] - Filmes \n[5] - Series \n[6] - Natureza \n[7] - Praia \n[8] - Festas \n[9] - Fumar \n[10] - Bebidas alcoolicas \n[11] - Música \n[12] - Academia")
        while verifGost {
            do{
                var entradaGosto = readLine()
                if let str = entradaGosto {
                    if let num = Int(str){
                        try validadeHobbie(value: num, str: str)
                        gostoNum = num
                    }
                }
                while gostosU.contains(Gostos(indice: gostoNum)){
                    print("Digite um interesse que não foi escolhido ainda entre: \n[1] - Jogos \n[2] - Esportes \n[3] - Viagens \n[4] - Filmes \n[5] - Series \n[6] - Natureza \n[7] - Praia \n[8] - Festas \n[9] - Fumar \n[10] - Bebidas alcoolicas\n[11] - Música \n[12] - Academia \n")
                    entradaGosto = readLine()
                    if let str = entradaGosto {
                        if let num = Int(str){
                            try validadeHobbie(value: num, str: str)
                            gostoNum = num
                        }
                    }
                }
                gostosU.append(Gostos(indice: gostoNum))
                verifGost = false
            }
            catch Erros.invalidHobbie{
                print("Digite uma das opções válidas de gostos entre: \n[1] - Jogos \n[2] - Esportes \n[3] - Viagens \n[4] - Filmes \n[5] - Series \n[6] - Natureza \n[7] - Praia \n[8] - Festas \n[9] - Fumar \n[10] - Bebidas alcoolicas \n[11] - Música \n[12] - Academia")
            }
            catch{
                print("Error")
            }
        }
        
        if i == 4 {
            break
        }
        
        print("Deseja acrescentar novos gostos? \n[1] - Sim \n[2] - Não")
        var verAc = true
        while verAc {
            do{
                let entradaCont = readLine()
                if let str = entradaCont {
                    if let num = Int(str){
                        try validadeOptionTwo(value: num, str: str)
                        continuar = num
                    }
                }
                verAc = false
            }
            catch Erros.invalidTwoOptions{
                print("Digite uma das duas opções válidas:\n[1] - Sim \n[2] - Não")
            }
            catch{
                print("Error")
            }
        }
        if continuar == 2{
            break
        }
    }
    return gostosU
}

//funcao que pede a faixa de idade de preferencia do usuário
func digiteRange() -> Int{
    print("\nConsiderando a sua idade, digite uma diferença entre idades aceitável.\nPor exemplo, se você possui 25 anos e deseja encontrar pessoas com idades entre 23 e 27 anos, digite \"2\".")
    var rangeU = 0
    let entradaRange = readLine()
    if let str = entradaRange {
        if let num = Int(str){
            rangeU = num
        }
    }
    return rangeU
}

//funcao que pede o sexo de preferencia do usuário
func digiteSexo() -> Sexos{
    print("\nVocê procura: \n[1] - Homens \n[2] - Mulheres \n[3] - Ambos")
    var sexoNum = 0
    var validA = true
    while validA{
        let entradaSexo = readLine()
        do{
            if let str = entradaSexo {
                if let num = Int(str){
                    try validadeSex(value: num, str: str)
                    sexoNum = num
                }
            }
            validA = false
        }
        catch Erros.invalidSex{
            print("Digite uma das opcoes validas\n[1] - Homens \n[2] - Mulheres \n[3] - Ambos")
        }
        catch{
            print("Error")
        }
    }
    return Sexos(indice: sexoNum)
}

//funcao que pede a data de nascimento do usuário
func digiteData() -> Date{
    let data = DateFormatter()
    data.dateFormat = "dd/MM/yyyy"
    print("\nDigite a sua data de nascimento no seguinte formato: DD/MM/AAAA. Não esqueça de separar o dia, mês e ano com a barra.")
    while true {
        do{
            let input = readLine() ?? ""
            try validadeDate(data: input)
            if let dataN = data.date(from: input) {
                return dataN
            }
        }
        catch Erros.invalidDate{
            print("Digite uma data válida no formato DD/MM/AAAA")
        }
        catch{
            print("Error")
        }
        
    }
}
//MARK: main

//MARK: cria a lista de pretendentes aleatorios
var listaPretendentes : [Pretendentes] = []
let listaNomesFemininos: [String] = ["Julia", "Sohpia", "Isabella", "Maria Eduarda", "Manuela", "Giovana", "Alice", "Laura", "Luiza", "Beatriz", "Mariana", "Yasmin", "Gabriela", "Rafaela", "Maria Clara", "Ana Clara", "Isabelle", "Lara", "Letícia", "Ana Julia", "Ana", "Nicole", "Valentina"]
let listaNomesMasculinos: [String] = ["Miguel", "Arthur", "Gael", "Théo", "Heitor", "Ravi", "Davi", "Bernardo", "Noah", "Gabriel", "Samuel", "Pedro", "Anthony", "Isaac", "Benício", "Benjamin", "Matheus", "Lucas"]
let listaSobrenomes: [String] = ["Silva", "Frisina", "Brum", "Pretto", "Riboli", "Masiero", "Teixeira", "Ilunga", "Serafini", "Lopes", "Martins", "Diefenbach", "Gusmão", "Thomas", "Cunha", "Claus", "Costa", "Maciel", "Venturini", "Pizzol", "Muller", "Ramos", "Sartori", "Dias", "Scherer", "Batistella", "Schostack", "Fernandes", "d'Alençol", "Araujo", "Stédile", "Fontanive", "Cavali", "Silvano", "Dourado", "Brendler", "Carneiro", "Gusmão", "Sakakibara", "Lemos", "Souto", "Yamaguti", "Godinho", "Izolan", "Trindade"]

for i in 0...999{
    if i < 500{
        listaPretendentes.append(Pretendentes(sexo: .masculino, nome: (listaNomesMasculinos[Int.random(in: 0...(listaNomesMasculinos.count-1))]) + " " + listaSobrenomes[Int.random(in: 0...(listaSobrenomes.count-1))]))
    }
    else{
        listaPretendentes.append(Pretendentes(sexo: .feminino, nome: (listaNomesFemininos[Int.random(in: 0...(listaNomesFemininos.count-1))]) + " " + listaSobrenomes[Int.random(in: 0...(listaSobrenomes.count-1))]))
    }
}
var possiveisPretendentes: [Pretendentes] = []
//

//MARK: cria usuário com as informações passadas pelo terminal

print("\nBem-vindo! \n\nDigite seu nome!")
var nomeU = ""
var entradaNome = readLine()
var nomeV = true
while nomeV{
    do{
        if let str = entradaNome {
            try validadeName(name: str)
            nomeU = str
        }
        nomeV = false
    }
    catch Erros.invalidName{
        print("Digite um nome somente com letras")
        entradaNome = readLine()
    }
    catch{
        print("Erro default")
    }
}
var alturaU = digiteAltura()
var fisicoU = digiteFisico()
var dataNascimentoU = digiteData()
var gostosU: [Gostos] = digiteGostos()
var rangeU = digiteRange()
var sexoU = digiteSexo()

var usuario =  Usuario(nome: nomeU,dataNascimento: dataNascimentoU, altura: alturaU, fisico: fisicoU, gostos: gostosU, rangeIdade: rangeU, sexo: sexoU)
//

//MARK: menu
var aplicacao = true
var opcaoMenu = -1
while (aplicacao) {
    print("\nOlá, \(usuario.nome)! \nBem-vindo ao SWIFTINDER 🔥.\nO que deseja fazer?\n\n[1]- DAR MATCHES\n[2]- Editar suas preferências\n[3]- Visualizar suas preferências atuais\n[4]- Visualizar lista de Matches\n\n[0]- Sair da aplicacao")
    
    let entradaMenu = readLine()
    
    do {
        if let str = entradaMenu, let num = Int(str) {
            try missingOption(option: str)
            try validadeOptionMenu(value: num, str: str)
            opcaoMenu = num
        }
    }
    catch Erros.invalidOptionMenu {
        print("Opção invalida, tente novamente")
        continue
    }
    catch Erros.missOption{
        print("Escreva algum valor")
        continue
    }
    catch {
        print("Error")
    }
    
    switch opcaoMenu {
    case 1:
        //MARK: dar match
        possiveisPretendentes.removeAll()
        
        //faz uma lista de pretendentes que correspondem aos gostos do usuário
        for p in listaPretendentes{
            var entrou = false
            if p.deuMatch == false{
                p.possivelPretendente = false
            }
            for gosto in usuario.gostos{
                guard let g = gosto else{
                    continue
                }
                if p.gostos.contains(g) && p.deuMatch == false{
                    possiveisPretendentes.append(p)
                    p.possivelPretendente = true
                    entrou = true
                    break
                }
            }
            if !entrou{
                continue
            }
            if p.idade<usuario.idadeMin || p.idade>usuario.idadeMax{
                possiveisPretendentes.removeLast()
                p.possivelPretendente = false
                continue
            }
            if p.altura != usuario.altura && usuario.altura != Alturas.qualquerA{
                possiveisPretendentes.removeLast()
                p.possivelPretendente = false
                continue
            }
            if p.fisico != usuario.fisico && usuario.fisico != Fisicos.qualquerF{
                possiveisPretendentes.removeLast()
                p.possivelPretendente = false
                continue
            }
            if usuario.sexo != .ambos && p.sexo != usuario.sexo{
                possiveisPretendentes.removeLast()
                p.possivelPretendente = false
                continue
            }
        }
        
        //da as opções de matches de acordo com as preferências do usuário
        for p in possiveisPretendentes{
            print("------------------------------------------------------------------------------------")
            p.toString()
            print("------------------------------------------------------------------------------------\n")
            print("Digite [1] para ❌, [2] para 💚 e [0] para voltar ao menu principal")
            var matchNum = -1
            var matchBool = true
            var entradaMatch = readLine()
            while matchBool {
                do{
                    if let str = entradaMatch {
                        if let num = Int(str){
                            try validadeMatch(value: num, str: str)
                            matchNum = num
                        }
                    }
                    matchBool = false
                }
                catch Erros.invalidMatch{
                    print("Digite uma informação válida entre:[1] para ❌, [2] para 💚 e [0] para voltar ao menu principal")
                    entradaMatch = readLine()
                }
                catch{
                    print("Error")
                    entradaMatch = readLine()
                }
            }
            
            //decide aleatórimente se vai dar match com o usuário ou não
            if matchNum == 2{
                let match = Bool.random()
                if match {
                    playMatchSound()
                    print("\nMATCH!!")
                    print("\(usuario.nome) ❤️ \(p.nome)\n")
                    p.deuMatch = true
                    usuario.listaMatch.append(p)
                }
            }
            if matchNum == 1{
                continue
            }
            if matchNum == 0{
                break
            }
        }
        
    case 2:
        //MARK: editar perfil
        var edicaoPerfil = true
        var edicaoNum = -1
        while edicaoPerfil {
            print("Qual informação de preferencia quer mudar?\n[1] - Altura\n[2] - Físico\n[3] - Gostos\n[4] - Faixa de Idade\n[5] - Sexo\n\n[0] - Retornar")
            let entradaEdicao = readLine()
            do{
                if let str = entradaEdicao {
                    if let num = Int(str){
                        try validadeOptionEdit(value: num, str: str)
                        edicaoNum = num
                    }
                }
                switch edicaoNum {
                case 1:
                    usuario.altura = digiteAltura()
                    
                case 2:
                    usuario.fisico = digiteFisico()
                    
                case 3:
                    usuario.gostos = digiteGostos()
                    
                case 4:
                    usuario.rangeIdade = digiteRange()
                    usuario.newRange()
                    
                case 5:
                    usuario.sexo = digiteSexo()
                    
                case 0:
                    edicaoPerfil = false
                    
                default:
                    print("Digite uma opção válida")
                }
            }
            catch Erros.invalidOptionEdit{
                print("Digite uma informação válida entre:\n[1] - Altura\n[2] - Físico\n[3] - Gostos\n[4] - Faixa de Idade\n[5] - Sexo\n\n[0] - Retornar")
            }
            catch{
                print("Error")
            }
        }
    case 3:
        //Ver preferências do usuário
        usuario.toString()
    case 4:
        //Ver lista de matches do usuário
        usuario.listaDeMatches()
    case 0:
        //Sair da aplicação
        aplicacao = false
        
    default:
        print("Digite uma opção válida")
    }
    
}

print("\n\nOBRIGADO POR USAR O SWIFTINDER 🔥")
