package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.entitites.Comment;

public class CommentDao {
	private Connection con;

	public CommentDao(Connection con) {
		this.con = con;
	}
	
	public boolean saveComment(Comment comm) {
		return false;
	}
	//idcomment, commentUName, commentDate, commentContent, commentLike, bugId
	public ArrayList<Comment> fetchCommentByBug(int bid){
		ArrayList<Comment> list = new ArrayList<Comment>();
		 try {
			String s = "select * from comment where bugId=?";
			PreparedStatement st = con.prepareStatement(s);
			st.setInt(1, bid);
			ResultSet set = st.executeQuery();
			while(set.next()) {
				Comment comm = new Comment();
				comm.setBid(set.getInt("bugId"));
				comm.setUname(set.getString("commentUName"));
				comm.setContent(set.getString("commentContent"));
				comm.setClike(set.getInt("commentLike"));
				comm.setCdate(set.getString("commentDate"));
				comm.setCid(set.getInt("idcomment"));
				list.add(comm);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return list;
	}
}
