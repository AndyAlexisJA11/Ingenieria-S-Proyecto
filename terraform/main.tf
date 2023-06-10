
resource "aws_api_gateway_rest_api" "example_api" {
  name        = "MyAPI"
  description = "API description"
}

resource "aws_api_gateway_resource" "example_resource" {
  rest_api_id = aws_api_gateway_rest_api.example_api.id
  parent_id   = aws_api_gateway_rest_api.example_api.root_resource_id
  path_part   = "my-resource"
}

resource "aws_api_gateway_method" "example_method" {
  rest_api_id   = aws_api_gateway_rest_api.example_api.id
  resource_id   = aws_api_gateway_resource.example_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "example_integration" {
  rest_api_id             = aws_api_gateway_rest_api.example_api.id
  resource_id             = aws_api_gateway_resource.example_resource.id
  http_method             = aws_api_gateway_method.example_method.http_method
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = "https://rickandmortyapi.com/"
}
resource "aws_api_gateway_deployment" "example_deployment" {
  rest_api_id = aws_api_gateway_rest_api.example_api.id
  stage_name  = "prod"
}
