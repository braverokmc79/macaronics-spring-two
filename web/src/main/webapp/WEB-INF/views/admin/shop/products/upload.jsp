<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<li>
  	<span class="mailbox-attachment-icon has-img"><img src="/products/img/${thumNameImage}" alt="Attachment"></span>
  	<div class="mailbox-attachment-info">
	<a href="" class="mailbox-attachment-name">${originalFilename}</a>
	<a href="${originalImage}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	
  </div>
</li> 	
