<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY Identification "FormHiddenDeclaration">
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
]>

<dir table="hdrules" code="ma_mau" order="ma_mau" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo ẩn các trường" e="Hidden Fields Rule"></title>
  <fields>
    <field name="ma_mau" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã mẫu" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_mau" allowNulls="false">
      <header v="Tên mẫu" e="Description"></header>
    </field>
    <field name="ten_mau2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="hddetailrules" external="true" clientDefault="0" defaultValue="0" rows="266" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label>
      <items style="Grid" controller="VisibleFieldRuleDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_mau, ma_mau" e="String: ma_mau, ma_mau"></text>
        </item>
      </items>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="326" anchor="4">
      <item value="120, 30, 70, 100, 230, 203"/>
      <item value="110: [ma_mau].Label, [ma_mau]"/>
      <item value="110000: [ten_mau].Label, [ten_mau]"/>
      <item value="110000: [ten_mau2].Label, [ten_mau2]"/>

      <item value="1: [hddetailrules]"/>

      <item value="11100: [status].Label, [status], [status].Description"/>

      <categories>

        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        <category index="-1" columns="120, 30, 70, 100, 230, 203" anchor="4">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwewhjBHAGpgV0N0C3O28IiX82gPB1ROJ+iz9y9FzOj0zqZoIQ/qJ4N6MFSYMMtwW++8hErJxD8p9Ur+aaRbFopj</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYIX+9k/KAiG4qbW2z0PH+3ZkJZJFYQWexkG9Qp526iNuhLcDctYlSnPjjgoOFCj5nADrIxIHKDREuxgVGCrGugh</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliNpFoZ5yh3uK9jjHyuWzX0Sdq3QtXZ2yLFSCh3NTSKLQBaKprsoGTGsHgz9aSnMLBfv181dr/XmGv+NLBi/Uupwk/Vo6n6WWVabndYaN7EbN0tp6RWEx06nmibf12lTZapdZLKEzhx14HQ5eKF+j7kpVJS7iu0R/baoKo1toRx35qFfz23oLsDEgjUjDoJcJK4ZFzTP/FR5sW52aEElRSFTBr4moog/fI4HK7osUbLpIeM9ZImR8whMv6Fpp+OzEW6aHGtZuiRnJT172PeABd5k79UBevUO7bJT3ESQJswP2vaPfDyDROKDyFWKn6QyzWt7L+cSVKS44NROXVzM9/decVqnInbSyaFMzIjCzVsc0=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nlTE8txLniCls1E8Qko8Ra4iQcx6R+K7H5H/kcWUf0KIdc40Ba0nyPFhcqp44xXvix+PfD4LvoMLEnLdL1JF5fP1JJt67C/dB1oW7i9Bd4VDPPZ0pKs1IP5FPnfrjIviuFBsZ0oF/LTkOgphTu5IhQo5PjAaywux9VQaSzjwZelkFBrdoLkf/M/LbmxrdbYgbUMQUhfhTagMYqo/qx9xa2jdZE720sPxn7pNYiCfVlV2beB4T8fTP8dKedz/De8oN</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwZY0urRMgjOlZ/ZK46iimt9+Ad7utdoTeuRG2btBYM1VhwMRGNK1cXxh/h57x6Zbbk4Sn2dFWHMNwTseQHHDdI=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jTKvWoBjp/59vNNa+96I+36gj2n26XmjoXkB+w63hTNKERSyDJzH2ZjZixVKcSikbNeS68eMEb7nnsQ0RdC1ssMyNq6dnDkTC9VK+s9y9W/hsqp4NSLZqzHzWo3g/9zI0b5mwrk0qZ8UtbB/mY6RSk8sFzNPU3PCnuKHFVaL2sAUrZNdPOqA+Krr/hmG/AV8E4SUhjtgPqHpIhRjkZ+z/MqSoylvJWk/PRLORTt39TPXO4fe6P4AbnnZnBwTkSM5OzixDWxdFVORsdKaRjIj3hZ747DUz2+viRYxEGVJPfcHOvVfp4I5azL8sL9wOZGhkJNG1edFLIQb7wfVlV4gVyQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7fN01aHkTVwJ0E3JQONQjDyPbuMxzRVU0WlDmyGa7bc6+xP0uAKhCrCBqKEHkfNShgGSU/3MNdVtiEvwWe8XNFkMXOcfGUjvGkECIM3LubMOn3+PLkl6lesRlBWWV35sthrcNu9KRzLlaBkjE2WpcwWPiB0OO4xlOgOnOmh307fqq9Amc3EgjeWAk2V0eaADQ==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6QPysYAPiixkgkv81aBVb56z+9nPXajDOql02+PZXQnhJyFQitz85ZW7Xkk728mw4A==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KYre/2qZP9iK9brh9Pge6SESQggfRmb93MIPxGBwh2aoGJXK+DijvuNuxmIrT0nW8/zXLE7Qi/+KWEGxe5M/fqH+c7+j6PrMP4lZhz/vnTDF3HJLH6wrUJebyycKAydf1SrkvCQw8vQVl+XmKKoizgUZXiur8p90mIWUI04ZFWdrSFd6l3ZDSnR+QSUoD1PJogjaCXk6Rg5wNVXBZ3wtb49nqjm+rQnhfnuuyFWt59BlGHTwdedjuAm5hD78gF/ZUwCJIdLoy/xhy+a4YFagqLJ9gsFyvmQOVT0OY/JfDNr2FmEVkxZYO1WqcrVQdg3yZTzo4v8iRxPlgfC4QR4RhcJa7NFh8JisjhTzkAnwGYofEdjPkporx/n826K8dNHgYflJXjznIN2mgpbjvtkzu22G7AJCLuTe1B/zuY0XYTVhlqa3cK+YDl+Oxpmda77SSvQr/UxOyOEVTO7CRJu3bMdgUisZRfSIkX/c4J+RXQZ1JOK2dGcs6Dv7KN+q+e84GriYS40jH4xgLD5egT7+e78yuPd+hzIcuNPrm34Wa4YKDazBpV0Qw0SQP1QMTJnIJfbm6nWNdILXwYuc1ox/r6tHOmJ/D0lBHs4je6ChhrRwzZvOmhADbchLYdLwF0LDEk9rWTgyk6DI6I9lAH6hTM=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZYE9dVadXr9EJ1S/jzCMfAQp4V3e37OnBaQm0O00JEo5hZFaGwoCWLfiJou0arurLVzhkOXOsQqbk/Ff5garuq3rcubwh42wcKpSZclC4SLEf5sFKehc8B+DW0yoWvxjfKBOGqMiGdqaHEvNstvsoT8y8NsIaiaO0jIpmJ7nLTBMotf6WIoA7lEmsHT+ZB6zPVKLdR9WxhDmbhUQrgI1bSd1fS3q5Xw6tM2A69vyWBzFDQlQozFtaawPRNysjIWNm5sLW+WENOn4E3Gfklz2zL/adD8sovDgPP1SPpvk1roNDGL+TtnQqSLEKVIEZodDmPcyLDwWzIbC0HCGDI95GLACCB1DmBrKkTLWINTYKTyCg5G07FME1O397rm9mRh/Cs56OpAXiqgFmds9r8z+8+mzaTQND9lwKcg/TFNYrlxbTCAezP43vBODNyZ8QOs3KJV2uPBpS8yTOSrMdhAlB/ZWxde3r1ElFLKRXBfKGBSIpmNgSOfUn/oRcKpirlDyU=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>