<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY Identity "Adjust">
  <!ENTITY % DetailTax SYSTEM "..\Include\DetailTax.ent">
  %DetailTax;
  <!ENTITY % EIOptions SYSTEM "..\Include\EIOptions.ent">
  %EIOptions;
  <!ENTITY % Discount SYSTEM "..\Include\Discount.ent">
  %Discount;
  <!ENTITY % EINote SYSTEM "..\Include\EINote.ent">
  %EINote;

  <!ENTITY r "'HD1', 'HDA', 'PXC', 'PXD'">

  <!ENTITY Key "declare @rk varchar(16)
select @rk = lower(left(replace(newid(),'-',''), 16))
update userinfo2 set rkey = @rk where id = @@userID">
]>

<dir table="userinfo2" code="name" order="name" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều chỉnh thông tin hóa đơn" e="Adjustment Invoice"></title>
  <fields>

    <field name="ckey" dataFormatString="@upperCaseFormat" external="true" defaultValue="''" allowNulls="false">
      <header v="Mã số" e="Authentication Code"></header>
      <items style="Mask"></items>
    </field>

    <field name="cpass" external="true" defaultValue="''">
      <header v="Xác nhận mật khẩu" e="Confirm Password"></header>
      <clientScript><![CDATA[<Encrypted>&i8xXBDxrUicbWBNXbvDJpliUSApVTzvNdiT+9b8CvmXDltvBhUQH36jT0VaktnNrg0qaTW0ujiw0weSAP8BIvw==</Encrypted>]]></clientScript>
    </field>
    <field name="chkpass" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230, 0"/>
      <item value="110: [ckey].Label, [ckey]"/>
      <item value="110-1: [cpass].Label, [cpass], [chkpass]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &Key;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJ6Z3osRRn7IZEXHQKbH7bvn00/BFtMGq+dcWebrvfFZckZWFj6+brozhXojIREiKnvdyyfAMDo/e8kIzJw+aq4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGojQ5ADIVEBaLG64gVmGQhdkBivJJ7HHq4omPmMEuFD</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WRjX5/6Pf0s6QTuF9Uw+uMyDWutOvw9S7cnNV+olGuVc5+C5XTHkKRWKwOPsG58SCLPBvqLe852oqQL5QH9G+sxp/DucQowk/yPhZZxjxRqdnTuUOj1/nhSehGBq1zuIrT4g3tJWsXsdyBedgsJgQH4rj+N0IvpWGC6uJeo9iIMRsbTqPlQXvGX/geBWAh+4veoRrLczTTWNoRUxuxMTEk=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Tvd2u3g0XAnvZmS9EIZCbw0U1/q4GFCn6Xlh0OPCNtx</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYreKa4/FdUvAcKPIuh0/y3RgeJywgl4Q1nFpSIDOiiWKmH6poeK2+1zV9KqTmMJIK2zIi+v5L+XuTWTVe+yaZzwI=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjgENDedfJil1w9lawBzPZ6B1HGJOPVP1wEqUnybcn/bOip7M9M6D9nL+8UlF2nsJ3bxeCiajulQpcr3emYaJpNqUlkpgkjMiQ8A/Z+wgRytZw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrQiKBZ/ItM5niFlX7/stf7dZYQXtrDLphXldwDT0dX9iN1hlpzbEITxa4AE52fElgGPxSYFRBAozKQEzzCQuwpg=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRv/MctzvTJT9MrMoXn9GkHpX9gGlPi2AmVLUTC0GsTyjAI872BX01mgNghyocDI81A=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYhpU71ALmfk5ffMVXbbEaC95FDNPuPVyyo0paJ5AWSXOQ/onvbV5bNXYdtHuIDX7H8jFKJNFaPszc306jhi5p998HqN/+iN2het+h93fdC3xpJYslAtNYNlklWocyHk+y4z4PLZZNLmj05DS4dnlVzCJVjJBFZOGYqXIK1T4iCJOuwUfHMap0qZTZyaYEou7TwZeryB64UA+Ev8dKHlfnVqJmSbCGiPr/Bh8aHJidu65yvyfzfcFxRobNiU8wYQ5Nh8VwOUitUygG+Jva/X1I3E0GA104lkxIo1kU1a4R2RQuxfOBvyNGriKBW3pEZ57HXCKvsAcrHYM0zKjTImxC32JR2CjirmNhLyALtHfg8WptgHsOe5KYunec/ML7iQMRSALRceMDxBa+9UMUpT7w10xLTvw/gAsmOn5hcq5nFtC9hg/SkNN4977tBe2EOvSA9kihIs+MQz+cnIY0SoNjMm4kWgmX9T4NE3XFzT1DFsNnBanrdV/tpgYs+36x8WWM0l2zsxsWqEMaJNZJeX9tUEfgHjIPorjPu3bmIWuEWC6POAsNqA6H1nv2NHC17hmxuMlaOa53knURXe3LfAd9dCnHWCO9WlCJDANnfEVT3PeZ3dj+1SHa8hndwJ/6HtcUmudgL+rCi9XmdH2moiU16ZvtzR0V+D/ZgxgqXY+qzBS4QMo5tpQzVEAX0Nnsu7KbAKd9lbILY6KI+vUpkz+Kwn7xs4ZeMEy049o+kFoEFKVWCghhndcrapAP4nRk3GpTwjecwzSHioUZOP+nnnRpqJTKdqkcZi3JH2UW247t78kkKsImp+bOpKsDhlcgo8YP8fVFKGi2pdARF6Kpvx9pVd1aS9PnvSatZlKkSy/orjyml16ydY4MPFlcWurrrnocmnk6a0/P0X2BhI11EtiaHFhlmBRUYsFFNsmGfCQ6zfsZl3yiWOaxogvOsI+it84ZNOMJlAQ4q26LDM5xOCih+upyN9rm+4MM6ytdp0w8bdsWPegJnq0s7KvfyZz3JXywIUXCfrkyJp86zkIRfAId36YcUR9B1Ofj4Fb9zwz43FibYaEFSvsoB7E2gOISsR1fI=</Encrypted>]]>&DetailTaxFlag;&EICustomerAuthentication;&DiscountFlag;&EINoteFlag;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR75IxnRAIuiVBGjU6cSx2EMN9t0aXgjp4ycZt3Cp45x/k1jT6tD3gWUKnuvsVnyuwfhmaDgVXG7tGMIRCZGsYmJ5oDbN86JqovVEOtUPZ8O3NEiJXEuj6VsNSsf8ydbwjtkucHobj19PATQokeJdl338cTZ2obu15OZvWK8YGmbjdzYX3xMKL+FcEX002gcSZ/Q/vFhoT2Js/1Y//64nPSTmlynh7V2iEYCAnfSBWGPosHEZsqBj6S3elrkOfGBnD6skn0bzvMlxnn/L6TXLk5CPN0s78uRJtHKJ5/NXO/tx0pEzEJsg1wvBIrnp1EaJwkCSs7fF2dLmr2zt1YJ/AhsYeARdGCgtgAI6kE2giPH7ZqX+d7k8Ka5GecjDjVwhY1qwatHJ84o+1+nZxmP0UC8epTkZTwoBUaG7rUAzq+vh2S7MNrFPg0AyhA9fM5d45pvZE5BJYk1XaM9SzAbb7qWbEQS2pSOe3O/4qf+yrQ68vLsIyQjTWTTZMWK0X2L/EcrWw/ZVEi+JDa7eJqT7kKr0coIRJsRYoc9r4hSmiw79eUHJ7f8uCR/gzOAw5lGun9igA5TcvdcLeevT3BQU9aaDzSdIZvFNh3bTDbX/PwDD4SaSfEQSYIDgJ7VLt/r4IYv5XkktXYXpBoya/IlovD5P7MaUh6NGoIP8AfZdyu8M+enFpQFGNLnIEC87jKD3eio4an69Fw3DfEb0PpcpLwFHtUjtDrcKVz0iM23K8tfQ9pJWrGoP+xeTR2hr9RX5hSFspjdAG1yx4uM7oK2M1/jn+NwbNNBPXDtHjC40q0al97jBcdpP1Y1rfgsMKmyotb340LJ6npN1GG3d584iPHfxI4QWjzrg25yj4x/HSCzbRTicV045x6oqS/H0Xr0ldgZ21ac/XciNKuGaSiqICDOJzNjx+xqXGGZmhSYo7uF5rRrlP/eo3CFAXumhaGJYazczCu60esXiwyALvOKRaEm9uxg1ATUIuZjYWL4rU7qNfNgKAkfKcB4stynN64s1dpsrLVmVe05vUejc5XZkklFvzmadbxToSzkc/u4HWD3dYCdp6Q65KGLsrYVK0JAqiUCZxVTTWQtEqHGXpDRKKdXcvOQj52ADyLP8Anu/XHd1cMK1kb9wPCgRrMt7BxzY2gTlKFrNaFvE4a9zFQKk/4VYBAP0tQ4JsK/F0YmF24e+6B69Siee2y87J/qXtusiWx1krQXmUGTWLhhwMqG+4m0ToXi0tjnOjJkxOLtTHZ4tCbnV0l2szviqRd8WbDdJ8Goty4AXG1rxq88devOnAV/JfPkCAJlNpW3FBbTrZAjK/Kg+BOFnrFsH1Ryt42vY+GZnryBSAAwAR0Dee7qaw2pImGyijFjavYOvUhmMGl/A+pFJUP+qvlaq1Syg5d1G5M3pj5oaupkyk83CnnqNvSk18Ychggt4rT6OGIxFamLUN86G075Uip75B9cIsQlwkMJZXDvFbSEr1bCAgo6yi74qVZi7FmhiGzUO41+OWzPfN0GStsNda5upzhCDkE2KRszx9h0y1cVpsBeKjGHgpU44wRmGT2HRQiIpcUWtH2k5oDtHKon5RniAZ3NoX4I74HtjSfNuOmZ2ATOcU0Jq2rB93KLemJiry4O3YrkdviH7TNdbEMBzBCoTcQgo9txvqCAmSucbjcJLth9TcR5JWfAXoVx4sQoV5O/3wUaTrWo4v3GcgVH/KtKn/B61yVEQlEGn399YUD+iFQxcCxtbtQ5E5cV1VCqw0B4haogrbffwkLXp+7JoTz/z8pmUHhH7yFQ4bbiRqqpvp7HTXcxBass5LvOKsHUVn4h8mRpZzfnhOc2g33jiuo5zkQKo22LzHuujQXZ/yYbyNGbe/x890RPm4Q6RFpUtgRQDujB/KmXyr8c4Jm/qvoD8QhK47gfC2H+hXkNpf7fmnFYJZyyXeAbY=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Key">
      <text>
        &Key;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFSBQg/pBQX51W2+SC6JFeQlYux5/aJVLXn3tCW+LRjpfAIianrkMuFLLZ95pGw6gw==</Encrypted>]]>
      </text>
    </action>

    <action id="CheckKey">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2QFC2P1K/gBCoiwOZkDh31ai1fCIQGArLLgWYzIt0jkoA3ZEKBPlJiPPYEi0MzckhshMilJGuklUNMkg2yeYU1NuSOA8kEv+7E5SbD/9BbczTKU9uEypmpqy969XqjyQxESW50I4KT2stDBpH5S0kPdlQcJNh3yxzvrgOfCaXURzmxEy2qeQ8+xoM4nTBEzZA==</Encrypted>]]>
      </text>
    </action>

    <action id="GetVoucherType">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyfOjH9AfawxBn0xVMfMNepcKv+qC9fx9CMQueZASAPJSMrq9SKWLlzr6qd6GXE7QVb1ahKgy/op8ChJMT90I0jKyoCk9kHJ++Yn8D2A1KGyjHlpByMKUKbxbpZ7Gdd9CQlDtzdnOyPPk+ucu5y8qzm7uk8i7J94o9vTlaQe1QDDbL6CPEAEau+oAxIkjMzEJBr/S4Wa2N4HjdUP5nh8VMyatsrJ0MdZZZuE9AB9ZMxTB3XHXBLFMGpdK+YXgYe+NA==</Encrypted>]]>&r;<![CDATA[<Encrypted>&2j7x4wWFdGquSCfbO6cYL1xdNfwEkQcd2QVrz0OFuz56Nvl4ezllNW5gp3GgUunVrgkoPukPsbKhf2DhNKt8CQ/hPrdjp+jnAaU0kssxad2wDj6ok4qFcWPP0cUmTGPsA4QZXB7Z0tdhzkn0lLk5LDSEtZyflyuffJbkDfj7+cOnTZgr0OCU4mZxll/L6OKmIji3Ehh7mqWIiwXPJy4e+DvFHMO/hf/vDTrpa5h2VCo2lRLx9YsYQJ1Nps2RMoyF+i6uSrAg+aCpQ1fGEEuJER+rAWUDHJ93OJkBlYsiqoxxxikSHxpyC+ze15ppVcbnbDj5J1B0DeFu9WqbA4kC/CFvGL3otimg42nWn/y3QMlf5nfjK73Q869G85hJ2P5q</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>