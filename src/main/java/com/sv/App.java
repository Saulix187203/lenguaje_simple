package com.sv;

import picocli.CommandLine;

import java.util.Scanner;
import java.util.concurrent.Callable;
import static picocli.CommandLine.*;

@Command(name = "sv", mixinStandardHelpOptions = true, version = "1.0",
        description = "Un programa de ejemplo para demostrar picocli")

public class App implements Callable<Integer> {
    @Override
    public Integer call() throws Exception {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Bienvenido al programa de ejemplo. Escribe 'salir' para terminar.");
        String input = "";
        do {
            input = scanner.nextLine();
            Parser parser = new Parser(new Lexer(new java.io.StringReader(input)));
            if (input.equals("salir")) {
                break;
            }

        }while (true);
        return 0;
    }

    public static void main(String[] args) {
        int excode = new CommandLine(new App()).execute(args);
        System.exit(excode);
    }


}