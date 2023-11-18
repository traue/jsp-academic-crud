package br.sisacademico.helper;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {

    public static String hashText(String t) {
        MessageDigest m;
        try {
            m = MessageDigest.getInstance("MD5");
            m.reset();
            m.update(t.getBytes());
            byte[] digest = m.digest();
            BigInteger bigInt = new BigInteger(1, digest);
            String hashText = bigInt.toString(16);
            while (hashText.length() < 32) {
                hashText = "0" + hashText;
            }
            return hashText;
        } catch (NoSuchAlgorithmException ex) {
            System.out.println("Erro na criptografia");
        }
        return null;
    }
}
