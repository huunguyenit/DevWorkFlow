<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
  <!ENTITY CommandWhenBalanceBeforeDelete SYSTEM "..\Include\Command\WhenBalanceBeforeDelete.txt">

  <!ENTITY k0 "@ma_dvcs = $ma_dvcs.OldValue and @ma_loai_lg = $ma_loai_lg.OldValue and @ma_bp = $ma_bp.OldValue">
  <!ENTITY k1 "ma_dvcs = @ma_dvcs and ma_loai_lg = @ma_loai_lg and ma_bp = @ma_bp">
  <!ENTITY k2 "ma_dvcs = $ma_dvcs.OldValue and ma_loai_lg = $ma_loai_lg.OldValue and ma_bp = $ma_bp.OldValue">
  <!ENTITY k3 "ma_dvcs &lt;&gt; $ma_dvcs.OldValue or ma_loai_lg &lt;&gt; $ma_loai_lg.OldValue or ma_bp &lt;&gt; $ma_bp.OldValue">
]>

<dir table="hrbtkcl" code="ma_dvcs, ma_loai_lg, ma_bp" order="ma_dvcs, ma_loai_lg, ma_bp" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo các bút toán kết chuyển lương" e="Salary Transaction Definition"></title>

  <fields>
    <field name="stt" type="Decimal" allowNulls="false" dataFormatString="##0">
      <header v="Số thứ tự" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ten_bt" allowNulls="false">
      <header v="Tên bút toán" e="Description"></header>
    </field>

    <field name="tk_no" allowNulls="false">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_no%l" key="status = '1' and loai_tk = '1'" check="loai_tk = '1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_no%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk_co" allowNulls="false">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_co%l" key="status = '1' and loai_tk = '1'" check="loai_tk = '1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_co%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_loai_lg" isPrimaryKey="true" allowNulls="false">
      <header v="Mã loại lương" e="Pay Type"></header>
      <items style="AutoComplete" controller="hrPayType" key="status='1'" check="1 = 1" reference="ten_loai_lg%l" information="ma_loai_lg$hrloailuong.ten_loai_lg%l"/>
    </field>
    <field name="ten_loai_lg%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_bp" isPrimaryKey="true" allowNulls="false">
      <header v="Mã bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_bp$hrbp.ten_bp%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZZuc9PT3ShTEbuuktnxmbi9lNVSNXeMDf+4qcss4PzxLg1+cH6ZLxgRo3BRlVhE20XottSQ5NQOaBQiLWdKTZuw=</encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_bp_phi">
      <header v="Mã bộ phận phí" e="Cost Center"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp_phi%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp_phi%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv">
      <header v="Mã vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1=1" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_phi">
      <header v="Mã phí" e="Expense"></header>
      <items style="AutoComplete" controller="Expense" reference="ten_phi%l" key="status = '1'" check="1 = 1" information="ma_phi$dmphi.ten_phi%l" new="Default"/>
    </field>
    <field name="ten_phi%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="256">
      <item value="100, 20, 30, 70, 120, 100, 100, 10"/>
      <item value="10101000: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="101: [stt].Label, [stt]"/>
      <item value="10100000: [ten_bt].Label, [ten_bt]"/>

      <item value="10101000: [tk_no].Label, [tk_no], [ten_tk_no%l]"/>
      <item value="10101000: [tk_co].Label, [tk_co], [ten_tk_co%l]"/>
      <item value="10101000: [ma_loai_lg].Label, [ma_loai_lg], [ten_loai_lg%l]"/>
      <item value="10101000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>

      <item value="10101000: [ma_bp_phi].Label, [ma_bp_phi], [ten_bp_phi%l]"/>
      <item value="10101000: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="10101000: [ma_phi].Label, [ma_phi], [ten_phi%l]"/>

      <item value="10110000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz3ED6wv6UAvCgdA0MY/Z/0FMFcpA7m5SM3ypXvvs23hwnJmnvROmB4V5wWsUEs20Pix+KJ73EMlgu9AEV6zd2eQhmOUmRcZ0d2jQtpIJZlV</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZgJkw7M0ADa6mad427Rdou7rbij1W55cpzU2s4UlFXzHSBYbk4laDHPQjprcPQF2fTth6QC9ICNGXfDAqzmu/EWSMyG4Vpr096pqvJUQFNExKQJFbbbGN2n47s6QyqzOfsmXtiNLdOj6lDNLKzO+oXsxqZeaq27wErAHfbmdd9Jz3Py/+hJX5k2Cu/FLEv1OWvW3qGVnM7w/MGIj9JwW7qLj1eycvS+zhlol7jMdBfvHMhyrJ4hbLBSn9burRhdeD/NZUAAXprssP/7wms4Wx80v8T8C1nzCj6mphTNG6+JA==</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>

      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz8h2R94E9vjRHnJe8iFc1GCBuE66FVj7bD08VRa/1zQJJvG8fAmS4/2JZVhFsCoH0WizPmMWVCMnfNKIHy+Mfh+kXvC1XA0BlAGjKt9EeJj</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb1W+i4Yu2FYMddmulhaGEZm10gYlp9cAwmucCZVSNqFe5AeVM8G1P/YXt2i7pCBQibwOnfGjjFfgB06HZb4ov+</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Re1Q5XJ2rRpPrTzqaEhesiqypbfrv/C0D0A+Lb+gdGS6591PQYRwE8sOjeNOp67THrkme0Fdt0+8kzJTWcM8CozwFNDswJLZMW4Bbt7hRx9mJK+kvW0jCy5a1v9Q48885QEai51HxrGeXlTOX/ly3w=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbQd4N2XDUUVt1eybgex+uYgIf34yBhalHuMhg2ubnwG/9FFOtvz6alqDrDV1FwRXSTtdjEAzSVs11ZkMeHlzYpJmJ8FQm5kVa09cxQ7VCFrcRkVUv0MlSeJVqHSHzOx9Pli/rznSNuADmjYNYw0djybV8uBQKtf4NPwCQRj8s8/FwyscFg9Xa4Sc2fc+8LQWbLx+PXubtOGOOGSH77bogK0qxD7eFzB2jX2KIE6GNoAeI+dVaUDqGn+CuwsW2RkodcBX+xvMnkDtxvnDgk7W2hBHYRh0xe3GN1TP91eG/781ihzxZsoJD1gqqmTB1G0FrtLgcfFMNRjcNqUd4+d2gZolRolemTHTk74OIl4739+LfsG71UsJkkKGvFrL/fRhy4A8npIoqXKASBuiT59exD3P4SqoMRqGp5GaBA1Jz23b66guSebWRvUj9G3awfqdcIRWJgCqHTeMkdglWnYwuKc2kLLRm/4oD8Z9/HN/CTVeNXn1pkWsPc8d204YIZMQw4JO4EEL0nGX8voPrlSQrBgLEcuBdrCgug0FQQvXcrMelVLxEh92PxC6F59iOjSr9BCXHgnho9KpxxUzjaHOaiwkL2lyZNbequ1q2yAv3uphKjYCIZ9+9qBYXI5xAaSPMtvJ9/tpcLcSpNnIywhvFNO6nRup5V5dWTFJT0WmTJBMwVDpNh+irfBMqBoCDiKm+cW/c8U+C2Gcpn1C4wbZN86vNt69i9MfbqXZYNkNrXfp9G6zcliF5bWVU2tTWX7aLE=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3chGulZx9js/QAMlXiOyoG+w==</encrypted>]]>&k1;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cN+5r5DGxhHZBSzn67khvmhOUhiOJrZO8dGfr7Q1nWMLhQR6D7TRlsbsDC/9V+hFRFD9UEp90dF+43yT3bNItr661btm1Fb4/GroGeDo6FNbJGmab3YiQ9JScp3F2kHkr7B06mP1PZo+TqNlSPpG54fb3pvbXElQvOyoz+4pgGwVzXJXu0hd7AnZzsBDfYK8TQP/9rp7yNyVP9UHDu8xOP8VlNvUywbBbJJoZZyMt0tNTWyd7C8UI10FRNVbGBHR67MWZ7MVqFVQBldY1sp8R+2F/aJmuJP5c0UvlIFub/Wt</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBqdxKyVHbMFGSgctjyato7AqFljnNQQ/9PzjGh6IVlLTQ==</encrypted>]]>&k2;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cN+5r5DGxhHZBSzn67khvmhOUhiOJrZO8dGfr7Q1nWMLFLoBz1N3v0ZnI0gysnPOdgEju1qFyWNCKRZ0DE2td9/ZipNcqc+Y+PJNL60a0IjAHpmFEsFFHHW3hIE6NNWkDbXHustSuYc+aS+MjG2nYGEqIvSHRnudvStvT0LMWmxmPD3TaVlFDcB1Kx6gLbQH6sxY97k2LO+iqwSeaZmCUDE=</encrypted>]]>&k0;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cE/hpETWHna8gLwEu3sbtN4/gTNFFQu0uenpQvEOpfKo64C+/GJR6A+stLGmvWCenQWjmiZXH5Ms/sggehN2p6w=</encrypted>]]>&k2;<![CDATA[<encrypted>%ShDm4LooPFnWfxWGAKIehxn5IEU5hwC3K054s/5gYTI=</encrypted>]]>&k1;<![CDATA[<encrypted>%ynJ3B2IMttZ3swIzstMMYbqlZD4zfaX6Mwe4vIA/i8YDRO/FRVaQyyQHpoTUDBaAgnAPSmoWHVusm5UeWFTmmON9vqB+EodcGzxq9jR7gWyVfhEwPf+TEPjDZPfhggV5HeNnRJqUhhm7cIk4hM4oubyMqgBvLkN+WXy8jjFbaFi16nFOYcXjcriOfBt4ochvMvY19ambriQoG6qwfptTwCtrzGU6uFE5L9xBXntgBz8=</encrypted>]]>&k2;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cNk0YFd5EoGKYtPL8PqndX67YyCdOVKo6pXsPrK7qvb4v630jVWMpJbddAlo6fyV8QU8IZH8TgdTLc2t3mhY/X9VxjQwnBAp6LdjZSNxdOwiLgMKyj9oCqjRDOXA8rN/fkZSSj5vcxVDh5THOA3C5WRviA6o2EtphdM1YZHjjoV5Apu6rWB97AzPHNDuP4Bnf2qy80yU3IlKdkjcaoqtdo3/c6xX//rVb+ufI8BF3RfI</encrypted>]]>&k3;<![CDATA[<encrypted>%ShDm4LooPFnWfxWGAKIeh5+eaTD3XduqXQNusOmMmVHJzVpslFZKMwxphdpWSbqh++7Ii/snCEYiXWQyZL+1mcsyZbvZ0zYLJHncJCD69JlivBZKIpOHW7y5QOjfEnlDb5kdlLj7QFl0gzygQlxLuBjqLjP7gC62et06Mt2K+NM=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeoJ+DOf3ngC8YWY8utprm/G1Ih6lFElGTucSk74648SzpeLwTNHbyg5XU6qlMX44RB9WLsvU+EAC+39HNZnyLlI=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandWhenBalanceBeforeDelete;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsOyfgbozNlMRW/o4sfw8nlPRIC1GFZWAhGvG/j0Oqc0Q==</encrypted>]]>&k1;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cN+5r5DGxhHZBSzn67khvmhOUhiOJrZO8dGfr7Q1nWMLisyU1raHkaADEBL1PDrbGqWLmSDCy7NeC3an4hwSZRST51C9uJ6uXhUMhGAdoELNRb9JAYVIZOhd1RAF5Nfks/WfNXUD12KXqpC7oioi65HOmglzIjLvKFmCqvMuFQjh</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70EcKKfv5JQnvpyFmhkLgaOT3A1YH3zC55ydAktHqnUpkcH/9RYBsn5R6Zs3a+nNYDsPLwnstSPrEziZjFnA8v2Whil+sxe+cCe4D8vYp5Pn4BJKXkkv95+UKQNFvWH34vy5e0CvlLr3g4kZTANg7qCuet++/IC7XiwslE2vgH73RRu/26B2tiMORJYpaaDIyIOpjeIWQqXRu8ge7D9G+6qB8ZBlCRwTQ9K5g+U0RszjhXPJ9io6TsVgV/LV3molbAtu/m9bzdeXSuBojHsvFkALVreoj3VfvNFmcC4+evIp7cbk/oiUeUoxf3XRX3T79BKl30lYyGJb2vmZPkrMx94WIg6MZH+vDbvNbzvGfOeptHNWL7Yi0PXq705CaL/SYNMI39Y334Sg2VKqyeWSBit5NvLkTu3ySHWAUdZ7SIIFbQ6fYIlJJnh6j9DDJjKRie/fqh89UJp+NQvGxZLYz+90fxDmzIktHN4vIv7QRGw0sFqIvMVnl/6ygDJtpb+JVUTIsJ4/4BYINxEHhNvWzTGjsTyxZIeUg9GaHMw6iqSrSJQYcmcr5zbBbeWFRsRFbHg==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Department">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3FRra9DrohIiIFbEuTaV0GdC91MUW9DO4YPD+UkhkryeNJtKLLKr3vmaWdsP6FnzRvxyhG93x8rLScl5i4cj3hXsFojw02qZUlFF7gX3MeXiksrgmjtuqMwbtTzPNXw9g==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>