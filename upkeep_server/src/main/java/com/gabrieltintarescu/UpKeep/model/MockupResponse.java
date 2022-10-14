package com.gabrieltintarescu.UpKeep.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author Gabriel Tintarescu
 * @project upkeep_server
 * @created 10/14/2022
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MockupResponse {
    List<String> data;
}
