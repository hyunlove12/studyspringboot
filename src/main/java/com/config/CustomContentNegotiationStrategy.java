package com.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.HttpMediaTypeNotAcceptableException;
import org.springframework.web.accept.ContentNegotiationStrategy;
import org.springframework.web.context.request.NativeWebRequest;

public class CustomContentNegotiationStrategy implements ContentNegotiationStrategy {
  
  @Override
  public List<MediaType> resolveMediaTypes (NativeWebRequest nativeWebRequest)
            throws HttpMediaTypeNotAcceptableException {
      List<MediaType> mediaTypes = new ArrayList<>();
      String acceptLang = nativeWebRequest.getHeader("Accept-Language");
      if (acceptLang == null || !acceptLang.toLowerCase().contains("en")) {
          mediaTypes.add(MediaType.APPLICATION_XML);
      } else {
          mediaTypes.add(MediaType.APPLICATION_JSON);
      }
      return mediaTypes;
  }
}