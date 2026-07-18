<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\PMGrid.ent">
  %UserDefinedFields;

  <!ENTITY % EnvironmentTax SYSTEM "..\Include\EnvironmentTax.ent">
  %EnvironmentTax;

  <!ENTITY XMLTaxFields SYSTEM "..\Include\XML\ImportTaxFields.txt">
  <!ENTITY XMLTaxViews SYSTEM "..\Include\XML\ImportTaxViews.txt">
  <!ENTITY XMLTaxResponse SYSTEM "..\Include\XML\ImportTaxResponse.txt">
  <!ENTITY XMLTaxQuery SYSTEM "..\Include\XML\ImportTaxQuery.xml">
  <!ENTITY XMLWhenTaxLoading SYSTEM "..\Include\XML\WhenTaxLoading.xml">
  <!ENTITY XMLWhenTaxClosing SYSTEM "..\Include\XML\WhenTaxClosing.xml">
  <!ENTITY ScriptTaxInit SYSTEM "..\Include\Javascript\ImportTaxInit.txt">
  <!ENTITY ScriptTaxClose SYSTEM "..\Include\Javascript\TaxClose.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">

  <!ENTITY f ", t_tt: '[t_tt]:=[t_tien0] + [t_cp] + [t_nk] + [t_ttdb] + [t_thue] &EnvironmentTaxExecuteExpression;', t_tt_nt: '[t_tt_nt]:=[t_tien_nt0] + [t_cp_nt] + [t_nk_nt] + [t_ttdb_nt] + [t_thue_nt] &EnvironmentTaxExecuteExpressionFC;'">
]>

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="PNB" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="c72$000000" prime="r30$" inquiry="i72$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    &XMLTaxFields;
  </fields>

  <views>
    <view id="Grid">
      &XMLTaxViews;
    </view>
  </views>

  <commands>
    &XMLWhenTaxLoading;
    &XMLWhenTaxClosing;
  </commands>

  <script>
    <text>
      &ScriptTaxInit;&f;&ScriptTaxClose;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XX9/iNqlgvZtmRHtFod1oyAtIr42+0U9oMSA8aDjurIvRG3EqTgaDwhbrDVIMdZ7qjNk6kQjbG/cQw3BkYXnS+gFAk2wFFmDspjwc13Fqvq49CJSinImcYlBQVjnH6WZlHZbBRZgTBCBNPiSD3IolW6kdf6nY/De1L4duHVMlpC+vzebckpfR8ECWFwnvapHQelz6GntDfQj38ufYozlpNGGlo5m3EvHmG714LxQh16eI1LxEcs3VtvEQKP5B3stYXf+wxuGZmnC/iD6L3rj7Kzopj3aEmjfcBtZdYDeUYwp4qBkK79xKZ9dRcswhzgclQRN69Qq81beUaDaBuWT50BTRFAlEVMm0eXGG3p1kD/RAl8AxZTDoJsnssNILlcy5GBAddNhF58nZ1GAMt9lxB0NV4Ca/tNGtyeWBBlcU/gvBvolcFwwvrUtNXA5lTvMGzY/p0OacsvitW+i8kLl5CKm4aeHMmknuKKi/baHtjUWLb8Qsdz8u0APlMC/CqLX/gh49E5P/V5T/GnNMxoSRKE3Z8XAPaZFvVIo9+lMELuHS1LPeawDAGg0g9ZoOUSLok/pMHU9keuzZ58zR/9XvNMxnPivNnHUt23bIQ0+9oY</Encrypted>]]>&EnvironmentTaxBaseAmount;<![CDATA[<Encrypted>&XpAcZ7HRWjEUU2F2AGbQf/1uTglaC3bXARrlNNKdPW0rZrEumNs3mmR5rEvlfrzCSAUOc9kDMV5Eyrd/l8pIfH5FgOEnuOZjhRF2/7eBekQ3Lr5XhheJVIZM5JLRBFtqgrk074Z/zbl5gIzER6NNxg==</Encrypted>]]>&EnvironmentTaxForeignAmount;<![CDATA[<Encrypted>&XpAcZ7HRWjEUU2F2AGbQfwUn8FvsXPO42xrCM59oowvWPutLMmIp0IbVrJWD7cBWW8En/nd3C5uK9pdRVJtZFqJ8bOopf08lyre/dE+cDRA5wy088V+4FlIY66236jO2ed4y0pg6UND/dFWzqz1D4kjQDeIQUgbboQRMvfG9WfoC1zxoslzDn+rJd3D2ZMSpctSTwP23nlnqhP10P9SFml1La4MQ+IukegP5GakX0xi4hrK+AX43ZlVCJKaXv7/Eo0NC0qM/mNEWeNcCDCinTkWqOoKxLrtCLeW+kUU9Mhn56Z31C47hnKLCoTg3TqXV8sJlN5LeUbhCkty+49erdzpgIypl11oqYeF+3a3xpRcaRHLLWinorzQbW/n0fKfnWy8H48fyQj/bbehUeZrP/w1rdTH1jwwNohQ6RouhJH+EsWXa8YnZWYeu+gPlHz2lgnhDmVQJmQKw4jt9DPU0EcfTmY06ruLv4qCf/WQucM/24t9YHUoDhiOKVGCgQi3ds+APaTM1l0iKrXQD5jcoIbVBnao+ycdk8B8aUyeguZb5pgfRMzo2piOwFH9KQSl/j7u9WNaXnYXfl+w9R1bMxkw354RBt5r2GPRVtcuFg158P+Knj6FwJkyOon7/DEbYBU57LXxz0JGoDve6zm3whipx1vMX1to0QL4axZyHCkLWVtCa4j++frDeDgT/2NSEpKXxNUKZu56uCBCO/1qPElqXusc5U280rr7D5Epxsmf1198qzRl28Ly+IG6ovjmhNg+Ad4oFP749OryH0b3LJLFZS6EC3ggD9gmFSYQgTlzrxXEaqGZWxmJXuDHdKFqio1bdN3TEOMeTs9b4asvSDQl7GjXMpx7S9jTuJ64sj6w=</Encrypted>]]>
    </text>
  </script>

  <response>
    &XMLTaxResponse;
  </response>

  &XMLTaxQuery;
  &XMLStandardDetailToolbar;
</grid>