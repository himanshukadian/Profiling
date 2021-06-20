package com.framework.model;


import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name="answerbank")
@NamedQuery(name="AnswerBank.findAll", query="SELECT a FROM AnswerBank a")
public class AnswerBank {
	@Id
	@Column(name="id")
	int id;
	
	@Column(name="answer")
	String answer;
	
	@Column(name="questionId")
	int questionId;
	
	@Column(name="quota")
	int quota;
	
	@Column(name="status")
	int status;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public int getQuota() {
		return quota;
	}
	public void setQuota(int quota) {
		this.quota = quota;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "AnswerBank [id=" + id + ", answer=" + answer + ", questionId=" + questionId + ", quota=" + quota
				+ ", status=" + status + "]";
	}
}
