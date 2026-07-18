<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "WPAdvancedWriteOffCreate">
]>

<dir id="0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tạo chứng từ tất toán cho các hóa đơn" e="Write-off"></title>
  <fields>
    <field name="ngay_tt" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày tất toán" e="Write-off Date"/>
      <clientScript><![CDATA[<Encrypted>&LvJqgbD8Ez2iFIn+GVZ4oebEFga3CHWew/lz5UoyZzL3sNLFOFRZfJqKIRkLkHcc</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB8QUWHZLW/J0UJTy5c8xIx/b2P9YnHQ0CxC9+aCSPcnw</Encrypted>]]></clientScript>
    </field>
    <field name="dien_giai" maxLength="100">
      <header v="Diễn giải" e="Description"/>
    </field>

    <field name="ma_quyen" onDemand="true">
      <header v="Mã quyển" e="Book Code"/>
      <items style="AutoComplete" controller="VoucherBook" reference="ten_quyen%l" key="status = '1' and ((ma_dvcs = '') or (ma_dvcs = @@unit)) and ((convert(smalldatetime, '{$%c[ngay_tt]}', 103) &gt;= ngay_hl_tu or ngay_hl_tu is null) and (convert(smalldatetime, '{$%c[ngay_tt]}', 103) &lt;= ngay_hl_den or ngay_hl_den is null)) and ma_nk in (select ma_nk from v20dmctnk where ma_ct = 'PC9' and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') &gt; 0))" check="((ma_dvcs = '') or (ma_dvcs = @@unit)) and ((convert(smalldatetime, '{$%c[ngay_tt]}', 103) &gt;= ngay_hl_tu or ngay_hl_tu is null) and (convert(smalldatetime, '{$%c[ngay_tt]}', 103) &lt;= ngay_hl_den or ngay_hl_den is null)) and ma_nk in (select ma_nk from v20dmctnk where ma_ct = 'PC9' and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') &gt; 0))" information="ma_nk$v20dmnk.ten_nk%l"/>
    </field>

    <field name="ten_quyen%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>

    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="keys" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
    <field name="maxLength" type="Int16" readOnly="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330, 0, 0, 0"/>
      <item value="11-111: [ngay_tt].Label, [ngay_tt], [ngay_ct1], [ngay_ct2], [keys]"/>
      <item value="1111: [ma_quyen].Label, [ma_quyen], [ten_quyen%l], [maxLength]"/>
      <item value="110: [dien_giai].Label, [dien_giai]"/>

    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIkDam2OpJKeUPrZ6I5WGFhnaMdP3TwDZh3ymfnifRK0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6vwF1B7d1GySFdWppW9fqaMOg5G8iQnsDUnx+RdclahhVM00gIu1UrUrCteDdYnn68u7TO2gitKsH9/+s2HntsHwx9FlornlYhvnQOJWQQ99fswy0FhuXJqr9Pjwps1dXUV/aazU7YBR0gg5xqOuIzKDcsmRBEa/H5sTpZNk76/jhOR45pIQZtFM6T9js+tlQEQwZhuSkt+Be+1Vm4UEOlEe0dam2H99qbI7k6ZIOluP6y1/hSZLkiQGQF665M+xrdz1DiSv9HqicyB5nGxYcgBpKa9vtDHGM3P0qJXfeJYiZEwfGzm8V2gHwC7oayPRBs2y7tkQnjvtMgCilV4acAwM9ycNkrzzR2tDY/B4bBi2xrOIeRvjW3HIYZwSENRdwJSVfo+cVIrPpA/J8Ak5aXYxtYHL71V/cC1+FmMkEuN7NkH3Lh+emx2hLdl1QTzMQtSIczDAGMa4AwDDtdBrTz8012Eg7yFqOK3x1aT3UzaRP13EMJ2J48bdV3NtV+TSPrM6XA+awcpLm6ON+0ElKtQ5EkTtYINlfYx9BzF9BR0Z1AFaQALSXftI8lDORKlatBUks/CwTsqHLKdTe54Gy5jcA8i8WkGabEh2+IA0a1kef2fk/BRDgR6q62bUy5aSPFra4hhVlLk0NJOQp5ZBQVlZd0AFHrn55wnk1VzVAIQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1xQ62TljBCi4DBJCzLbeFNi+Lwvf+0FfLTAGNk6bbzfFb+Xda0DjdDaJZ4BcYTSeMw==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTO5uETKQkyT3d3qZcTFmtcAgJKXjn7u/w24/2t5g1D4Ip8Vqo7SEXuKWgDpK7oVPalfM9KqIJwy7kpaSAMyhSevjGWwHHZt0fSf+tt99b96oBph4/7dfostY5XZW6Mbd/dtQnVeZAvLqc/9/Bcnpt5eTzeZYKrIyK8yhJN4xYCYrJjxL3AVx5ddz7438oqwLqF1Wgi+YvaGjNb2We1mA4r4hoBFA+fteZag//4OwzOtbmJr79yldrEnEZqp6sONUjQFrBp4jtZm0Z94eFCx3lQprk+WudVUC+QhPuuZwhMFHi0YdoPg22HM3IqOBcmUs1w==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l15aO01HH673awFvT3xukt4V/5H/sGFBq2nIcvQjVYSf19xEyT2o+tBhgwdfYAyJnMBOFoR6hwEUiozeN2p79CHRqJJ+5uVhCQqTzcZ6ybJd1BWkmMrVg+jeClDO6Gq9BrEJi9DzUYIxMtaSLWVBEI5YbFB+2N7Bma3DbFBQ4x28C6eGg5t2v1Ce1+F02uq2tu/pLqOzXEWPrv8QucdjnsirRN2nnZVFwt70sqPqVYbCuD5ATsuiScnyfQhZE/sj1tg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l15aO01HH673awFvT3xukt4UVTdf+b5Gfq9Mk9YhLwUOhZMM/rUK4dLz/egObLIxxMUfaAGu+Nyd3qGpeaiQDv4I7WY0Ap02+ZDyZCw3MVdNzcR+30ugkO2hAzPeK1V09NZKIfZaXFBCqQ7e2yNCDgzk=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB06/cj7y7gbX3NpdW32Q80vn9iG/l1crn/TCMnbTuznXXvmHTSUH26JQCW9Zei4tMvTZs9BvyJVBl9a6Qexj2IkqFjnoNsdl5zR6t3GyNQhU1xWiyxF+eZXj1Zz5QXP/Eg==</Encrypted>]]>
    </text>
  </script>

</dir>