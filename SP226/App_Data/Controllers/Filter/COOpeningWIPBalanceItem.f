<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY Control ", @$control = '10010'">
  <!ENTITY CostingUnitFilterShowing SYSTEM "..\Include\Command\CostingUnitInputFilterShowing.txt">
  <!ENTITY CostingUnitFilterInserting SYSTEM "..\Include\Command\CostingUnitFilterInserting.txt">
  <!ENTITY CostingUnitFilter SYSTEM "..\Include\Javascript\CostingUnitFilter.txt">
]>

<dir table="xcdvtdd" code="ky, nam, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" order="ky, nam, ma_dvcs, ma_yt, ma_sp, ma_bp, so_lsx, ma_vt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc vật tư dở dang đầu kỳ" e="Filter Opening WIP Balance by Item"></title>
  <fields>
    <field name="ma_yt">
      <header v="Mã yếu tố" e="Cost Factor"></header>
      <items style="AutoComplete" controller="Factor" reference="ten_yt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_yt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11010: [ma_yt].Label, [ma_yt], [ten_yt%l]"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    &CostingUnitFilterShowing;

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    &CostingUnitFilterInserting;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm48ywl12W5t8msu1RZTak8z7xhHGNn8IOOKDQdXLQqqvI6TlDBbXskie9hwiMfy2OmMh17B88YFitNWdUQ5+r8FC2Cy1iR+i3VKpPVj5Zgb8jCIgvZBdtbQHgtsg2nWhgit4QOSvyrgzs2IH7bi0Tatj61E55hcMNXA4IE5kNon1fd9HShSA7Rx72wdJQ12WBN6QXGpdYlQNXQVH3e2JTgwfAJJTiJnlMGG2eIlh1/txl0KKFhBo6utIpst+Vatu+FiYnG5tzjJsDLDnfiXw51g9B94c+FQMBcGER4KZ8Ho0fYWIQovb+jpZXXz6fvYIv8+VsqIsxokEj73gr3+/5mX+ICni+IbOTXLVuamm67YzgGLMdx9pWG4jCzS3MUtiIMzV2kLeOUuv0pbueCvlc9t668PsTGOSJfcDyoD+LcjwFPLECx/AYCeq89JZQUoWGjBMxiyn/ENtpEIzKjc0hRH+lrZcBNoJs3tKJjF8D0H4ZbDR0Cep2n/WhIyjFJ9ueGYNxvOCY4kuyAV1C0pJX2aejRdZR0jRst3MrXeqleb/2pwSXDona/o2VC+uPbVgIS5Nz6PEnR0O3mR1zZo3Mu2WHDomrrCo7GFPpqMVB5rnFg==</encrypted>]]>
      &CostingUnitFilter;
    </text>
  </script>

</dir>