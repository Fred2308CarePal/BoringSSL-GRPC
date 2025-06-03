Pod::Spec.new do |s|
  s.name     = 'BoringSSL-GRPC'
  s.version  = '0.0.41'
  s.summary  = 'Patched version of BoringSSL-GRPC to remove openssl_grpc'
  s.homepage = 'https://github.com/grpc/grpc'
  s.license  = { :type => 'Apache', :file => 'LICENSE' }
  s.authors  = 'gRPC contributors'
  s.source   = { :git => 'https://github.com/grpc/grpc', :tag => 'v1.72.0' }

  s.module_name  = 'BoringSSL_GRPC'
  s.requires_arc = true

  s.source_files = 'src/**/*.{h,c,cc,s,S}', 'include/**/*.h'
  s.public_header_files = 'include/**/*.h'

  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'HEADER_SEARCH_PATHS' => '"${PODS_TARGET_SRCROOT}/include"',
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++14'
  }

  # ✅ This excludes openssl_grpc
  s.exclude_files = [
    'src/crypto/x509/**/*',
    'src/include/openssl_grpc/**/*'
  ]
end

