<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmloaitc" code="ma_loai" order="stt, ma_loai" xmlns="urn:schemas-fast-com:data-dir">
  <title v="loại thu, chi" e="Cash Flow Type"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã loại" e="Type Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_loai" allowNulls="false">
      <header v="Tên loại" e="Description"></header>
    </field>
    <field name="ten_loai2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="tinh_chat" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Tính chất" e="Property"></header>
      <footer v="1 - Thu, 2 - Chi" e="1 - Inflow, 2 - Outflow"></footer>
      <items style="Mask"/>
    </field>
    <field name="stt" type="Decimal" dataFormatString="###0" defaultValue="0">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="ghi_chu">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110-: [ma_loai].Label, [ma_loai]"/>
      <item value="1100: [ten_loai].Label, [ten_loai]"/>
      <item value="1100: [ten_loai2].Label, [ten_loai2]"/>
      <item value="1110: [tinh_chat].Label, [tinh_chat], [tinh_chat].Description"/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>
      <item value="110-: [stt].Label, [stt]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5ekeHVq0dK92+Dnrd76xYZ7U42xK8LKscg/qdRdKQsO2iOMrPS5u3agaekwyWgGH65IusMIXQHTydNJzL6P4N4=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4VoMQaMr6luHdyhebPN8Zein7qFmPhwLU8Zqe4zIPHHa4NfBwZPaGHaybGiNR5602RTv7qeIgjh5vPLVBBGJIA=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI3FFnmPQ/gNVD+srYipERh+Idw3ef7L/6fdFyVWzdGdf636E4vtzRctS9kBJ4lWWC4tpK0CcCrkJM5BFxHkR4cOIA+QpaPo/Q8DlT4q33Wy3KL6L4SW2YhBRib9VkcRBnncJytOr05p8fV1sY2DE05GbJZX77T5mvZYoGNQiC49IV6dtxEJ2Gqkougb5ABa+qGKn4X85nZJjbHmFoIYxZe0zzNgPrdWRjGCR3Ljli065qMF+0Zjfmo8sgCGe7G0eV7NLG4L6rgP/mwiDndFIQxuRSh1esF5O42V+yi8q1gGyKenWTXtTEcpqKjyU/TZZKZ+O3bMwiH5vQMUPPpuIZ473dyxtjmwjJ2vif1QyR0kiJEHS10XMkybLGB8HotP3z/4VUXd9eZrrVDZO2fsdPA5YncTrb/Od5A/0KtqQqq9iJgfkj67dUBSxKsAs4VXBWXWM/4IS3y8j1HU+6pANZy8SjXp8PIjC7ausRm12aMqeNsEvLm46RUtIFkD5D2rGewutgubv3hWfZ6neJYOVm9k=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cB9InGALYcerZl/TmoDEM0YNWo4/TzLP+Jh7XnzAUBVXOT2LD57xm+rGzAwbHac55wQ5Np7ZTmBazz0PkEYv1KZg70flXEy3Bs2uG67MNg7QoSPVEhKmjhRv+QyelgxZroNU7s1kDAHPnbFKNwgJqv4QU1KiDRx1aIRwPUNtgukcX7+bmyulwhqHTgKn7styVMB9man0hXX1P1hbRjQAHP2aBXL4F/ObodsCG8zglfWI=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jwMlrCDlMuk2ZBU7CprWOeBQqJNNbL3cRPPtAK5XkyLEl0Yzku2qKKv/3tCgy/05sK5+PunNJoVkI34S5PexdpUuHK7S4ZnExLVOrk1OSVp7uB/sgmX1dVpcn0yw7nO+mRWyD40YlE4Y3cOED/0jEQHqzhfLdF/EjQVpxorljrn9Kg4OM13Amnkmx0rwmB/b3CZQXbxEWVMYR+h7RJjgLjp8AW8v1WwS4DE5JE3eiFPEex/+hdtMLf4dDlJuPr2OU23Agjrdbiqln+BHU2RkYJj7wPUwtPPLkMTxsEuPBEKhcvqf5BYZOF1IHVUBoiV0cwAZkhoAmcv9EaeYhdH8OoK6kkXOBISs8rjB/FxbEHmhjKOZizhqJCwqRsTCfk8BPd2hTbmC4bS0uhKRi1Tseahvo5hhz3pD1tCRY7+7zys1iXqlXyUgOBfh/cYZagYxTHkTX4VkKBcMM1zL/XRQG7cch6URxQkHVgu5pEojffPCElelnH2iLkmerrGu5hzKhM16xrS9lA1Kmc7J24Fg43TwnEepKrIrdCeTHioyfzHHhe9ffYuQ4P/JncQ1LPW7u</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbetWfBl0hcG73VT+s/+ZHj2hznlozytuZ4Xiqd+p6WVUY</encrypted>]]>
      </text>
    </command>


    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bIf17vBl+i6lp1QqsYVFgziBLvrzwHyDm1NEjBmuPBh4tYESvoV3HQQKOdC0+RDzA171HGjoBwYitSr+OtaSxqNgPR4FTFJ9jAxn8iyzulQOOA5aqRpN2/6N+FmJhRV2dAOMkhMczJ8oT5aP4e8SPMHJsuwkum5B/OSR+qrE2laofDUW0xYuGbvAWx8kSSbcmOvnYSJjxGybTU+RTPZgxN2+uROi8HvC3PTsfL4a3SkFQh5iTql6D0A5IFpd/dxaPduaQ/xqZ+tKAPmYchJoxIHimSuOULdbmVkXYZDhnDkwzXPl9wCW7V3rlByvSOMnjH1674Et+PZu2Xa1Mj0tiqYFT/A6HKjuGotmU+G+p3C4OPN0P19r2wgoUIf5Pabvg==</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70CSnquJuQVw1FOA3RXxOCAKx7pEaMUjyPmM6W+2UkXrA4dI+u3wVQf9xDYFcC1eb8Ds49pHrLkvQpOgIMurgn2nk5afcMrmX+01rvQLkoYAAr2gH3DK0SZxL3hO0PcSInGjH1n0j8VwxU4DLf78lZhbCzK1hp7cBtya9b+zA/iJvsIA+MJIFVZ5R59YbwpHuzHbUFzcnA1Q6vMujwS37P/dxaV3rFfDHAanfZ07YZ0NPBWK07hIbYW5HVIxy9CWvkEE/vebYeG0RL9p3u6MXDjm+esac+nKR58c39hmBdmSaQ0hnafk/s3ZkIFZ8fFPtMorl42mRyDLCvSSk0TUI4+5Z5AQAQ4TUuVSirSrcai64</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>