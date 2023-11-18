package br.com.traue.academicsys.model;

public class Student {

    private int idAluno;
    private String nome;
    private int ra;
    private Course curso;

    public Student() {
    }

    public Student(int idAluno, String nome, int ra, Course curso) {
        this.idAluno = idAluno;
        this.nome = nome;
        this.ra = ra;
        this.curso = curso;
    }

    public int getIdAluno() {
        return idAluno;
    }

    public void setIdAluno(int idAluno) {
        this.idAluno = idAluno;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getRa() {
        return ra;
    }

    public void setRa(int ra) {
        this.ra = ra;
    }

    public Course getCurso() {
        return curso;
    }

    public void setCurso(Course curso) {
        this.curso = curso;
    }
}
