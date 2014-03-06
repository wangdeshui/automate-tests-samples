class TableWrapper
  def initialize(table_element)
    @table=table_element
  end

  def rows_count
     rows= @table.find_elements(:tag_name => 'tr')

     if(rows.empty?)
       return 0;
     else
       return rows.length
     end
  end


end