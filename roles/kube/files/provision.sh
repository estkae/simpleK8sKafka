grep -q '176.9.122.215' /etc/hosts && sed -i 's/176.9.122.215.*/176.9.122.215           download.docker.com registry-1.docker.io auth.docker.io k8s.gcr.io dl.k8s.io storage.googleapis.com apt.kubernetes.io packages.cloud.google.com gcr.io registry.gitlab.com gitlab.com charts.gitlab.io kubernetes-charts.storage.googleapis.com production.cloudflare.docker.com k8s.io docker.elastic.co docker-auth.elastic.co docker-auth.elastic.co d2iks1dkcwqcbx.cloudfront.net/g' /etc/hosts || echo '176.9.122.215           download.docker.com registry-1.docker.io auth.docker.io k8s.gcr.io dl.k8s.io storage.googleapis.com apt.kubernetes.io packages.cloud.google.com gcr.io registry.gitlab.com gitlab.com charts.gitlab.io kubernetes-charts.storage.googleapis.com production.cloudflare.docker.com k8s.io docker.elastic.co docker-auth.elastic.co docker-auth.elastic.co d2iks1dkcwqcbx.cloudfront.net' >> /etc/hosts