<!DOCTYPE html>
<html>
    <head></head>
    <body>
        <div>
            <h1>Hello</h1>
        </div>
        <div class="container">
            <#if allProd?has_content>
                <div class="test">
                    <#list allProd as product>
                        <div class="d-block col-lg-3 col-12">
                            <a class="category-product" href="/tfe-website/product/${product.productId}">
                                <figure class="figure">
                                    <#if product.mediumImageInfo??>
                                        <img width="90%" class="figure-img img-fluid" src="tfe-website/assets/${product.mediumImageInfo.contentLocation}">
                                    <#else>
                                        <#if product.smallImageInfo??>
                                             <img width="90%" class="figure-img img-fluid" src="tfe-website/assets/${product.mediumImageInfo.contentLocation}" >
                                        </#if>
                                    </#if>
                                        <figcaption class="text-left title-product-text figure-caption">
                                            ${product.productName}
                                        </figcaption>
                                        <figcaption class="text-primary text-left figure-caption">
                                            <span class="product-price-text">$${product.price}</span>
                                        </figcaption>
                                    <span></span>
                                </figure>
                            </a>
                        </div>
                    </#list>
                </div>
            </#if>
        </div>
    </body>
</html>