package com.gabrieltintarescu.UpKeep;

import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;

/**
 * @author Gabriel Tintarescu
 * @project upkeep_server
 * @created 10/14/2022
 */
public class RestBuilderFactory {
    @Bean
    public RestTemplateBuilder restTemplateBuilder() {
        return new RestTemplateBuilder();
    }
}
